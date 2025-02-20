package com.example.UI;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.TabPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class MainUI extends Application {

    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("MovieDownloader");

        VBox mainLayout = new VBox(10);
        mainLayout.setPadding(new Insets(10));

        TabPane mainTabs = new TabPane();
        mainTabs.setPrefHeight(800);

        // Adding tabs
        mainTabs.getTabs().add(new TorrentDownloadUI().getTab());
        mainTabs.getTabs().add(new DirectDownloadUI().getTab());
        mainTabs.getTabs().add(new AnimeDownloadUI().getTab());
        mainTabs.getTabs().add(new DescargasUI().getTab());
        mainTabs.getTabs().add(new MiBibliotecaUI().getTab());
        mainTabs.getTabs().add(new AjustesUI().getTab());

        mainLayout.getChildren().add(mainTabs);

        Scene scene = new Scene(mainLayout, 1200, 800);
        scene.getStylesheets().add("file:/C:/Users/G531/IdeaProjects/Moviesad/lib/styles.css");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}