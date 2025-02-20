package com.example.UI;

import javafx.scene.control.Tab;
import javafx.scene.layout.VBox;

public class TorrentDownloadUI {
    private Tab tab;

    public TorrentDownloadUI() {
        tab = new Tab("Torrent Download");
        tab.setClosable(false);

        VBox layout = new VBox(10);
        // Add your UI components for Torrent Download here

        tab.setContent(layout);
    }

    public Tab getTab() {
        return tab;
    }
}