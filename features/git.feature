Feature: Git repository
  Background:
    Given I have created a app with pah

  Scenario: Create a git repo
    Then I have a .git
    When I cd to "myapp"
    And I run `git status`
    Then the stdout should contain:
      """
      nothing to commit (working directory clean)
      """
