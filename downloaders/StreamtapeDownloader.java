package com.example.downloaders;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StreamtapeDownloader {

    private static final String API_URL = "https://streamtape.com/api/v1/download";
    private static final String BASE_URL = "https://streamtape.com";

    public static void main(String[] args) {
        String videoUrl = "https://streamtape.com/v/9qKvpQ64DwiDVZ"; // Cambia esta URL con la URL real
        downloadVideo(videoUrl);
    }

    public static void downloadVideo(String urlString) {
        if (urlString == null || urlString.isEmpty()) {
            System.out.println("URL no válida");
            return;
        }

        // Extraer el video ID de la URL
        String videoId = getVideoId(urlString);
        if (videoId.isEmpty()) {
            System.out.println("URL no válida para Streamtape");
            return;
        }

        try {
            // Obtén el ticket de descarga de la API
            String ticket = getDownloadTicket(videoId);
            if (ticket != null && !ticket.isEmpty()) {
                System.out.println("Esperando 5 segundos...");
                Thread.sleep(5000); // Espera de 5 segundos (simulando tiempo de espera)

                String downloadUrl = BASE_URL + "/v/" + videoId + "?ticket=" + ticket;
                startDownload(downloadUrl);
            } else {
                System.out.println("No se pudo obtener el ticket de descarga.");
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private static String getVideoId(String url) {
        // Patrón para extraer el ID del video desde diferentes URLs de Streamtape
        Pattern pattern = Pattern.compile("(?:streamtape\\.com\\/v\\/)([\\w\\-]+)\\/.+");
        Matcher matcher = pattern.matcher(url);

        if (matcher.find()) {
            return matcher.group(1);
        }

        return "";
    }

    private static String getDownloadTicket(String videoId) {
        String ticket = "";
        try {
            // Formar la URL de la solicitud
            String requestUrl = API_URL + "?video_id=" + videoId;

            // Crear conexión HTTP
            URL url = new URL(requestUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(5000);

            // Verificar que la solicitud fue exitosa
            if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
                // Leer la respuesta
                InputStream inputStream = connection.getInputStream();
                BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
                reader.close();

                // Analizar la respuesta JSON (aquí asumimos que la respuesta tiene un campo "ticket")
                String jsonResponse = response.toString();
                ticket = extractTicketFromJson(jsonResponse);
            } else {
                System.out.println("Error al obtener el ticket de descarga.");
            }
        } catch (IOException e) {
            System.out.println("Error al hacer la solicitud: " + e.getMessage());
        }

        return ticket;
    }

    private static String extractTicketFromJson(String jsonResponse) {
        // Aquí se asume que la respuesta JSON tiene una estructura como {"ticket": "ticketValue"}
        Pattern pattern = Pattern.compile("\"ticket\":\"([^\"]+)\"");
        Matcher matcher = pattern.matcher(jsonResponse);

        if (matcher.find()) {
            return matcher.group(1);  // Devuelve el ticket extraído
        }

        return "";
    }

    private static void startDownload(String downloadUrl) {
        try {
            URL url = new URL(downloadUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(5000);

            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                System.out.println("Error al conectar al servidor.");
                return;
            }

            // El nombre del archivo de destino es el último segmento de la URL
            String fileName = downloadUrl.substring(downloadUrl.lastIndexOf("/") + 1);
            InputStream inputStream = connection.getInputStream();
            FileOutputStream fileOutputStream = new FileOutputStream(fileName);

            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                fileOutputStream.write(buffer, 0, bytesRead);
            }

            inputStream.close();
            fileOutputStream.close();
            System.out.println("Descarga completada: " + fileName);

        } catch (IOException e) {
            System.out.println("Error al descargar el archivo: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
