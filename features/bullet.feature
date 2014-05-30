@no-clobber
Feature: Bullet
  Background:
    Given I have created the app "myapp" with pah

  Scenario: Have correct files
    Then I have a config/initializers/bullet.rb

