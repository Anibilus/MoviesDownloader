package com.example.UI;

import javafx.scene.control.Tab;
import javafx.scene.layout.VBox;

public class AnimeDownloadUI {
    private Tab tab;

    public AnimeDownloadUI() {
        tab = new Tab("Anime Download");
        tab.setClosable(false);

        VBox layout = new VBox(10);
        // Add your UI components for Anime Download here

        tab.setContent(layout);
    }

    public Tab getTab() {
        return tab;
    }
}