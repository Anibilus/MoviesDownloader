package com.example.UI;

import javafx.scene.control.Tab;
import javafx.scene.control.TabPane;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.VBox;

public class DescargasUI {
    private Tab tab;

    public DescargasUI() {
        tab = new Tab("Descargas");
        tab.setClosable(false);

        TabPane downloadsTabs = new TabPane();
        Tab tabTorrents = new Tab("Torrents");
        tabTorrents.setClosable(false);

        Tab tabDirectas = new Tab("Descargas Directas");
        tabDirectas.setClosable(false);

        downloadsTabs.getTabs().addAll(tabTorrents, tabDirectas);

        // Torrent downloads table
        TableView<Download> torrentsTable = new TableView<>();
        TableColumn<Download, String> torrentNameCol = new TableColumn<>("Nombre");
        TableColumn<Download, Double> torrentProgressCol = new TableColumn<>("Progreso (%)");

        torrentNameCol.setCellValueFactory(new PropertyValueFactory<>("name"));
        torrentProgressCol.setCellValueFactory(new PropertyValueFactory<>("progress"));

        torrentsTable.getColumns().addAll(torrentNameCol, torrentProgressCol);

        tabTorrents.setContent(torrentsTable);

        // Direct downloads table
        TableView<Download> directTable = new TableView<>();
        TableColumn<Download, String> directNameCol = new TableColumn<>("Nombre");
        TableColumn<Download, Double> directProgressCol = new TableColumn<>("Progreso (%)");

        directNameCol.setCellValueFactory(new PropertyValueFactory<>("name"));
        directProgressCol.setCellValueFactory(new PropertyValueFactory<>("progress"));

        directTable.getColumns().addAll(directNameCol, directProgressCol);

        tabDirectas.setContent(directTable);

        VBox layout = new VBox(10);
        layout.getChildren().add(downloadsTabs);

        tab.setContent(layout);
    }

    public Tab getTab() {
        return tab;
    }
}