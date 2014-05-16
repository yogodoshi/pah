Feature: Layout
  Background:
    Given I have created a app with pah

  Scenario: Have correct files
    Then I have a app/views/layouts/application.html.slim
    Then I have a app/views/application/_error_messages.html.slim
    Then I have a app/views/application/_flash_messages.html.slim
    Then I have the file app/views/layouts/application.html.slim and contents of this file should include:
      """
      = page_title(app_name: 'example')
      """
