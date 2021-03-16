package com.epam.ta.unideb;

import io.cucumber.junit.CucumberOptions;

@CucumberOptions(
    features = "src/test/resources/features",
    glue = "com.epam.ta.unideb"
)
public class TestRunnerIT {

}
