Feature: Database
  Background:
    Given I have created a app with pah

  Scenario: Have correct files
    Then I have the file config/database.yml and contents of this file should include:
      """
      database: myapp_development
      """
    Then I have the file config/database.yml and contents of this file should include:
      """
      database: myapp_test
      """
    Then I have the file config/database.yml and contents of this file should include:
      """
      production:
        url: <%= ENV["DATABASE_URL"] %>
      """
    Then I have a db/schema.rb


