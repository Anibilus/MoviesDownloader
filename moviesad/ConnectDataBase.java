package com.example.moviesad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDataBase {
    private static final String USER = "root";
    private static final String PASSWORD = "Rolankor_09";
    private static final String HOST = "127.0.0.1";
    private static final int PORT = 3306;
    private static final String DATABASE = "torrent_db";
    private static final String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE;

    private Connection connection;

    public ConnectDataBase() {
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Connection to the database established successfully!");
        } catch (SQLException e) {
            System.err.println("Failed to connect to the database.");
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
            }
        } catch (SQLException e) {
            System.err.println("Failed to reconnect to the database.");
            e.printStackTrace();
        }
        return connection;
    }

    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Connection to the database closed.");
            } catch (SQLException e) {
                System.err.println("Failed to close the database connection.");
                e.printStackTrace();
            }
        }
    }
}