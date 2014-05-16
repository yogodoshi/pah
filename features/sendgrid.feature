Feature: SendGrid
  Background:
    Given I have created a app with pah

  Scenario: Have correct files
    Then I have the file config/environments/production.rb and contents of this file should include:
      """
      config.action_mailer.default_url_options = { host: ENV['CANONICAL_HOST'] }
      """
    Then I have the file config/environments/production.rb and contents of this file should include:
      """
      config.action_mailer.smtp_settings = {
      """

