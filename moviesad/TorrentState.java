package com.example.moviesad;

import java.io.Serializable;

public class TorrentState implements Serializable {
    private static final long serialVersionUID = 1L;

    private final String torrentSource;
    private final String destinationPath;
    private final long bytesDownloaded;
    private final int piecesComplete;
    private final int piecesTotal;

    public TorrentState(String torrentSource, String destinationPath, long bytesDownloaded,
                        int piecesComplete, int piecesTotal) {
        this.torrentSource = torrentSource;
        this.destinationPath = destinationPath;
        this.bytesDownloaded = bytesDownloaded;
        this.piecesComplete = piecesComplete;
        this.piecesTotal = piecesTotal;
    }

    public String getTorrentSource() {
        return torrentSource;
    }

    public String getDestinationPath() {
        return destinationPath;
    }

    public long getBytesDownloaded() {
        return bytesDownloaded;
    }

    public int getPiecesComplete() {
        return piecesComplete;
    }

    public int getPiecesTotal() {
        return piecesTotal;
    }
}
