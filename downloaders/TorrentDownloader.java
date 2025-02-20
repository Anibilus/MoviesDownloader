package com.example.downloaders;

import bt.Bt;
import bt.bencoding.types.BEList;
import bt.bencoding.types.BEString;
import bt.metainfo.Torrent;
import bt.runtime.BtClient;
import bt.runtime.BtRuntime;
import bt.runtime.Config;
import bt.data.Storage;
import bt.data.file.FileSystemStorage;
import bt.tracker.http.HttpTrackerModule;
import com.example.moviesad.UI;
import javafx.application.Platform;
import bt.bencoding.model.BEObject;
import bt.bencoding.types.BEMap;
import bt.bencoding.serializers.BtParseException;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.*;

import bt.bencoding.serializers.BEParser;
import java.util.concurrent.ConcurrentHashMap;

public class TorrentDownloader {
    private final ExecutorService downloadPool; // Pool de hilos optimizado
    private final Map<UI.Download, BtClient> activeDownloads; // Mapa de descargas activas
    private final Map<UI.Download, String> downloadSources; // Mapa de las fuentes de descarga

    // Lista de trackers predeterminados
    private static final List<String> BEST_TRACKERS = List.of(
            "udp://tracker.opentrackr.org:1337/announce",
            "udp://open.demonii.com:1337/announce",
            "udp://open.tracker.cl:1337/announce",
            "udp://open.stealth.si:80/announce",
            "udp://explodie.org:6969/announce",
            "udp://exodus.desync.com:6969/announce",
            "udp://tracker.torrent.eu.org:451/announce",
            "udp://tracker.tiny-vps.com:6969/announce",
            "udp://tracker.theoks.net:6969/announce",
            "udp://tracker.skyts.net:6969/announce",
            "udp://ns-1.x-fins.com:6969/announce",
            "udp://discord.heihachi.pw:6969/announce",
            "http://www.genesis-sp.org:2710/announce",
            "http://tracker.xiaoduola.xyz:6969/announce",
            "http://tracker.lintk.me:2710/announce",
            "http://tracker.bittor.pw:1337/announce",
            "http://t.jaekr.sh:6969/announce",
            "http://shubt.net:2710/announce",
            "http://servandroidkino.ru:80/announce",
            "http://buny.uk:6969/announce"
    );

    public TorrentDownloader(int maxConcurrentDownloads) {
        this.downloadPool = Executors.newFixedThreadPool(maxConcurrentDownloads);
        this.activeDownloads = new ConcurrentHashMap<>();
        this.downloadSources = new ConcurrentHashMap<>();
    }

    private int getRandomPort() {
        return ThreadLocalRandom.current().nextInt(1, 65536); // Puerto aleatorio entre 1 y 65535
    }

    public void downloadTorrent(String torrentSource, String destinationFolder, UI.Download download) {
        CompletableFuture.runAsync(() -> {
            try {
                File targetDirectory = new File(destinationFolder);
                if (!targetDirectory.exists() && !targetDirectory.mkdirs()) {
                    throw new IOException("No se pudo crear la carpeta de destino: " + destinationFolder);
                }

                Storage storage = new FileSystemStorage(targetDirectory.toPath());
                Config config = new Config() {
                    @Override
                    public int getAcceptorPort() {
                        return getRandomPort();
                    }
                };

                BtRuntime runtime = BtRuntime.builder()
                        .module(new HttpTrackerModule())
                        .build();

                BtClient client;
                if (torrentSource.startsWith("magnet:")) {
                    String enrichedMagnet = enrichMagnetWithTrackers(torrentSource, BEST_TRACKERS);
                    client = Bt.client()
                            .config(config)
                            .storage(storage)
                            .magnet(enrichedMagnet)
                            .autoLoadModules()
                            .build();
                } else {
                    File torrentFile = new File(torrentSource);
                    if (!torrentFile.exists() || !torrentSource.endsWith(".torrent")) {
                        throw new IllegalArgumentException("Archivo .torrent no válido: " + torrentSource);
                    }
                    replaceTrackers(torrentSource);
                    Torrent torrent = loadTorrentFromFile(runtime, torrentFile);
                    client = Bt.client()
                            .config(config)
                            .storage(storage)
                            .torrent(() -> torrent)
                            .autoLoadModules()
                            .build();
                }

                activeDownloads.put(download, client);
                downloadSources.put(download, torrentSource);

                client.startAsync(state -> {
                    int totalPieces = state.getPiecesTotal();
                    int completedPieces = state.getPiecesComplete();
                    double progress = (totalPieces == 0) ? 0 : Math.round(((double) completedPieces / totalPieces * 100.0) * 100.0) / 100.0;
                    Platform.runLater(() -> download.setProgress(progress));

                    if (completedPieces == totalPieces && totalPieces != 0) {
                        client.stop();
                        activeDownloads.remove(download);
                        downloadSources.remove(download);
                        Platform.runLater(() -> download.setStatus("Completado"));
                    }
                }, 1000);

            } catch (Exception e) {
                Platform.runLater(() -> {
                    download.setStatus("Error");
                    showAlert("Error", "Fallo al descargar el torrent: " + e.getMessage());
                });
            }
        }, downloadPool);
    }

    public void pauseDownload(UI.Download download) {
        BtClient client = activeDownloads.get(download);
        if (client != null) {
            client.stop();
            Platform.runLater(() -> download.setStatus("Pausado"));
        }
    }

    public void resumeDownload(UI.Download download) {
        String source = downloadSources.get(download);
        if (source != null) {
            downloadTorrent(source, download.getDestination(), download);
            Platform.runLater(() -> download.setStatus("Reanudado"));
        }
    }

    public void removeDownload(UI.Download download, boolean deleteFile) {
        BtClient client = activeDownloads.get(download);
        if (client != null) {
            client.stop();
            activeDownloads.remove(download);
            downloadSources.remove(download);

            if (deleteFile) {
                File file = new File(download.getDestination(), download.getName());
                if (file.exists() && !file.delete()) {
                    System.err.println("No se pudo eliminar el archivo: " + file.getAbsolutePath());
                }
            }
        }
    }

    private String enrichMagnetWithTrackers(String magnetLink, List<String> trackers) {
        StringBuilder builder = new StringBuilder(magnetLink);
        trackers.forEach(tracker -> builder.append("&tr=").append(tracker));
        return builder.toString();
    }

    private Torrent loadTorrentFromFile(BtRuntime runtime, File torrentFile) throws IOException {
        try (var inputStream = Files.newInputStream(torrentFile.toPath())) {
            return runtime.service(bt.metainfo.IMetadataService.class).fromInputStream(inputStream);
        }
    }

    private void showAlert(String title, String message) {
        Platform.runLater(() -> {
            javafx.scene.control.Alert alert = new javafx.scene.control.Alert(javafx.scene.control.Alert.AlertType.ERROR);
            alert.setTitle(title);
            alert.setHeaderText(null);
            alert.setContentText(message);
            alert.showAndWait();
        });
    }
    public void replaceTrackers(String torrentPath) throws IOException, BtParseException {
        Path torrentFilePath = Paths.get(torrentPath);
        byte[] fileContent = Files.readAllBytes(torrentFilePath);
        BEParser parser = new BEParser(fileContent);
        BEMap torrentData = parser.readMap();
        Map<String, BEObject<?>> torrentMap = new HashMap<>(torrentData.getValue());
        if (torrentMap.containsKey("announce")) {
            torrentMap.put("announce", new BEString(BEST_TRACKERS.getFirst().getBytes()));
        }
        BEList announceList = buildAnnounceList(BEST_TRACKERS);
        torrentMap.put("announce-list", announceList);
        BEMap modifiedData = new BEMap(torrentMap);
        try (var outputStream = Files.newOutputStream(torrentFilePath)) {
            modifiedData.writeTo(outputStream);
        }
        System.out.println("Trackers reemplazados en el archivo original: " + torrentPath);
    }

    private BEList buildAnnounceList(List<String> trackers) {
        List<BEList> trackerGroups = new ArrayList<>();
        for (String tracker : trackers) {
            List<BEObject<?>> trackerGroup = new ArrayList<>();
            trackerGroup.add(new BEString(tracker.getBytes()));
            trackerGroups.add(new BEList(trackerGroup));
        }
        return new BEList(trackerGroups);
    }

    public void shutdown() {
        activeDownloads.values().forEach(BtClient::stop);
        downloadPool.shutdown();
        try {
            if (!downloadPool.awaitTermination(5, TimeUnit.SECONDS)) {
                downloadPool.shutdownNow();
            }
        } catch (InterruptedException e) {
            downloadPool.shutdownNow();
            Thread.currentThread().interrupt();
        }
    }
}