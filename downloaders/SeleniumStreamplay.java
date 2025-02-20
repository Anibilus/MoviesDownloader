package com.example.downloaders;

import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Paths;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;

public class SeleniumStreamplay {
    public static void main(String[] args) {
        // Obtener la ruta del proyecto dinámicamente
        String projectPath = System.getProperty("user.dir");

        // Rutas relativas para ChromeDriver y Chrome for Testing
        String chromeDriverPath = Paths.get(projectPath, "lib", "chromedriver-win64", "ChromeDriver.exe").toString();
        String chromeBinaryPath = Paths.get(projectPath, "lib", "chrome-win64", "chrome.exe").toString();
        String extensionPath6 = Paths.get(projectPath, "lib", "nopecha.crx").toString();
        String extensionPath7 = Paths.get(projectPath, "lib", "popblock2.crx").toString();

        // Configurar WebDriver con rutas relativas
        System.setProperty("webdriver.chrome.driver", chromeDriverPath);

        // Configurar opciones de Chrome
        ChromeOptions options = new ChromeOptions();
        options.setBinary(chromeBinaryPath);
        options.addExtensions(new java.io.File(extensionPath6));
        options.addExtensions(new java.io.File(extensionPath7));
        options.addArguments("--start-maximized");
        options.addArguments("--disable-blink-features=AutomationControlled");

        // Inicializar WebDriver
        WebDriver driver = new ChromeDriver(options);
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);

        // Abrir la URL
        driver.get("https://stre4mplay.one/umx4lvjtmd76");

        try {
            WebDriverWait wait = new WebDriverWait(driver, java.time.Duration.ofSeconds(60));

            // Esperar y cambiar al iframe del CAPTCHA
            WebElement recaptchaIframe = wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//iframe[contains(@title, 'reCAPTCHA')]")));
            driver.switchTo().frame(recaptchaIframe);
            System.out.println("✅ Cambiado al iframe del reCAPTCHA");

            // Detectar checkbox del reCAPTCHA
            WebElement captchaCheckbox = wait.until(ExpectedConditions.presenceOfElementLocated(By.id("recaptcha-anchor")));
            System.out.println("⏳ Esperando que el CAPTCHA se resuelva...");

            // Esperar hasta que el CAPTCHA esté resuelto (cuando su atributo 'aria-checked' sea 'true')
            wait.until(ExpectedConditions.attributeToBe(captchaCheckbox, "aria-checked", "true"));
            System.out.println("✅ CAPTCHA resuelto correctamente");

            // Volver a la página principal
            driver.switchTo().defaultContent();

            // Intentar hacer clic en el botón "Proceed to video" varias veces
            boolean clicked = false;
            int attempts = 0;
            while (!clicked && attempts < 5) {
                try {
                    // Esperar a que el botón "Proceed to video" sea visible y clickeable
                    WebElement continueButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("btn_download")));

                    // Scroll hasta el botón
                    ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", continueButton);
                    Thread.sleep(500); // Pequeño delay para estabilidad

                    // Hacer clic en el botón
                    continueButton.click();
                    System.out.println("✅ Click en 'Proceed to video'");
                    clicked = true;

                    // Esperar y cerrar ventanas emergentes
                    Thread.sleep(2000);
                    String originalWindow = driver.getWindowHandle();
                    for (String window : driver.getWindowHandles()) {
                        if (!window.equals(originalWindow)) {
                            driver.switchTo().window(window).close();
                        }
                    }
                    driver.switchTo().window(originalWindow);
                } catch (ElementClickInterceptedException e) {
                    System.out.println("⚠️ Click interceptado, intentando de nuevo...");
                    attempts++;
                } catch (Exception e) {
                    e.printStackTrace();
                    break;
                }
            }

            // Obtener el src del video
            WebElement videoElement = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("video.jw-video")));
            String videoSrc = videoElement.getAttribute("src");
            System.out.println("✅ Video SRC encontrado: " + videoSrc);

            // Pedir datos al usuario
            Scanner scanner = new Scanner(System.in);
            System.out.print("Introduce el nombre del archivo: ");
            String fileName = scanner.nextLine();
            System.out.print("Introduce la carpeta de destino: ");
            String folderName = scanner.nextLine();
            System.out.print("Introduce el idioma: ");
            String language = scanner.nextLine();

            // Descargar el video
            downloadVideo(videoSrc, folderName, fileName, language);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }

    private static void downloadVideo(String videoUrl, String folderName, String fileName, String language) {
        // Ruta destino
        String destinationPath = Paths.get(folderName, fileName + "_" + language + ".mp4").toString();

        try (BufferedInputStream in = new BufferedInputStream(new URL(videoUrl).openStream());
             FileOutputStream fileOutputStream = new FileOutputStream(destinationPath)) {
            byte[] dataBuffer = new byte[1024];
            int bytesRead;
            long totalBytesRead = 0;
            long fileSize = new URL(videoUrl).openConnection().getContentLengthLong();

            while ((bytesRead = in.read(dataBuffer, 0, 1024)) != -1) {
                fileOutputStream.write(dataBuffer, 0, bytesRead);
                totalBytesRead += bytesRead;
                int progress = (int) ((totalBytesRead * 100) / fileSize);
                System.out.print("\rDescargando: " + progress + "%");
            }
            System.out.println("\n✅ Video descargado en " + destinationPath);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}