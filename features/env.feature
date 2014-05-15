Feature: Env files
  Background:
    When I run `pah myapp` interactively
    And I type "n"
    Then the output should contain:
      """
      CONGRATS! INSTALLATION COMPLETE!
      """

  Scenario: Create env files
    Then I have .ruby-version
    Then I have .ruby-gemset
    Then I have .env


