Feature: Test all features
Scenario: Get the page
  When https://ua.linkedin.com/in/test-guy-12160410b scrapped
  Then status is 200

# Scenario: Parse basic
  # Then status is 200
