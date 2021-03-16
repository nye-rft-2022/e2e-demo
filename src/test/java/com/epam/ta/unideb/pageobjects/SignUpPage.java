package com.epam.ta.unideb.pageobjects;

import org.springframework.stereotype.Component;

import com.epam.ta.unideb.factory.WebDriverFactory;

@Component
public class SignUpPage extends CommonPageObject {

    public SignUpPage(final WebDriverFactory factory) {
        super(factory);
    }
}
