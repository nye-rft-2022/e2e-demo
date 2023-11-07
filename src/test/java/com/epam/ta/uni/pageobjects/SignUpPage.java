package com.epam.ta.uni.pageobjects;

import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.springframework.stereotype.Component;

import com.epam.ta.uni.factory.WebDriverFactory;

@Component
public class SignUpPage extends CommonPageObject {

    @FindBy(css = "span.ButtonInner-sc-14ud5tc-0.bhKQRg.encore-bright-accent-set")
    private WebElement registrationButton;

    @FindBy(id = "username")
    private WebElement emailInput;

    @FindBy(id = "confirm")
    private WebElement confirmEmailInput;

    @FindBy(id = "password")
    private WebElement passwordInput;

    @FindBy(id = "year")
    private WebElement yearInput;

    @FindBy(id = "day")
    private WebElement dayInput;

    private final Map<String, WebElement> inputFieldsMap = Map.of(
            "Email address", emailInput,
            "Enter your email again.", confirmEmailInput,
            "Create a password.", passwordInput,
            "YYYY", yearInput,
            "DD", dayInput
    );

    public SignUpPage(final WebDriverFactory factory) {
        super(factory);
    }

    public void clickOnRegistrationButton() {
        waitForElementToBeClickable(registrationButton);
        registrationButton.click();
        waitForPageReadiness();
    }

    public WebElement getInputFieldByName(final String name) {
        getWebDriverFromFactory().manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        return inputFieldsMap.get(name);
    }
}
