package com.example.UI;

import javafx.scene.control.Tab;
import javafx.scene.layout.VBox;

public class DirectDownloadUI {
    private Tab tab;

    public DirectDownloadUI() {
        tab = new Tab("Direct Download");
        tab.setClosable(false);

        VBox layout = new VBox(10);
        // Add your UI components for Direct Download here

        tab.setContent(layout);
    }

    public Tab getTab() {
        return tab;
    }
}