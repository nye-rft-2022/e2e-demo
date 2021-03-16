package com.epam.ta.unideb.pageobjects;

import org.openqa.selenium.support.PageFactory;

import com.epam.ta.unideb.factory.WebDriverFactory;

public class CommonPageObject {

    private WebDriverFactory factory;

    public CommonPageObject(final WebDriverFactory factory) {
        PageFactory.initElements(factory.getWebDriver(), this);
        this.factory = factory;
    }
}
