Feature: Rack::Deflater
  Background:
    Given I have created a app with pah

  Scenario: Have correct config
    Then I have the file config/application.rb and contents of this file should include:
      """
      config.middleware.use Rack::Deflater
      """

