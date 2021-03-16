package com.epam.ta.unideb.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan("com.epam.ta.unideb")
public class TestConfig {
    public static final long PAGE_OR_ELEMENT_LOAD_WAIT_SECONDS = 15;
}
