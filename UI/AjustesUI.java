package com.example.UI;

import javafx.scene.control.Tab;
import javafx.scene.layout.VBox;

public class AjustesUI {
    private Tab tab;

    public AjustesUI() {
        tab = new Tab("Ajustes");
        tab.setClosable(false);

        VBox layout = new VBox(10);
        // Add your UI components for Ajustes here

        tab.setContent(layout);
    }

    public Tab getTab() {
        return tab;
    }
}