Feature: Git repository
  @announce
  Scenario: Create a git repo
    When I run `pah myapp` interactively
    And I type "n"
    Then the output should contain:
    """
    CONGRATS! INSTALLATION COMPLETE!
    """
    Then I have a created repo


