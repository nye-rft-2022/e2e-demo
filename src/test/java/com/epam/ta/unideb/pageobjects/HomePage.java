package com.epam.ta.unideb.pageobjects;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.springframework.stereotype.Component;

import com.epam.ta.unideb.factory.WebDriverFactory;

@Component
public class HomePage extends CommonPageObject {
    private static final String HOME_PAGE_URL = "https://www.spotify.com/hu/";

    @FindBy(css = "header li:nth-child(5) > a")
    private WebElement registrationButton;

    public HomePage(final WebDriverFactory factory) {
        super(factory);
    }
}
