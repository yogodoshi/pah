Feature: Secure Headers
  Background:
    Given I have created a app with pah

  Scenario: Have correct files
    Then I have the file app/controllers/application_controller.rb and contents of this file should include:
      """
      ensure_security_headers
      """
    Then I have a config/initializers/secure_headers.rb
    Then I have the file config/initializers/secure_headers.rb and contents of this file should include:
      """
      ::SecureHeaders::Configuration.configure do |config|
      """
