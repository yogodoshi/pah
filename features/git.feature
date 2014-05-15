Feature: Git repository
  Background:
    When I run `pah myapp` interactively
    And I type "n"
    Then the output should contain:
      """
      CONGRATS! INSTALLATION COMPLETE!
      """

  Scenario: Create a git repo
    Then I have a created repo


