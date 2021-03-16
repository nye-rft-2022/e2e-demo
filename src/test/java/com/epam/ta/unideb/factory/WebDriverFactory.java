package com.epam.ta.unideb.factory;

import static com.epam.ta.unideb.config.TestConfig.PAGE_OR_ELEMENT_LOAD_WAIT_SECONDS;

import java.util.Objects;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import io.github.bonigarcia.wdm.WebDriverManager;

@Component
public class WebDriverFactory {
    private static final Logger LOGGER = LoggerFactory.getLogger(WebDriverFactory.class);

    private WebDriver webDriver;

    public WebDriver getWebDriver() {

        webDriver = setUpChromeDriver();

        webDriver.manage().window().setSize(new Dimension(1920, 1080));
        webDriver.manage().timeouts().pageLoadTimeout(PAGE_OR_ELEMENT_LOAD_WAIT_SECONDS, TimeUnit.SECONDS);

        return webDriver;
    }

    private WebDriver setUpChromeDriver() {
        WebDriverManager.chromedriver().setup();

        LOGGER.info("ChromeDriver was created");
        return new ChromeDriver();
    }

    public void closeWebDriver() {
        if (Objects.nonNull(webDriver)) {
            webDriver.quit();
            webDriver = null;
            LOGGER.info("WebDriver was closed");
        }
    }

}
