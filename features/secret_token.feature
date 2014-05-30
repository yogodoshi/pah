Feature: Secret Token
  Background:
    Given I have created a app with pah

  Scenario: Have correct files
    Then I have the file .env and contents of this file should match:
      """
      SECRET_TOKEN: \w+
      """
    Then I have the file config/initializers/secret_token.rb and contents of this file should include:
      """
      Myapp::Application.config.secret_key_base = ENV['SECRET_TOKEN']
      """
