Feature: Creation of files

  In order to use pah, I need to check some files
  are created correctly

  Scenario: Running pah without heroku
    When I run `pah myapp` interactively
    And I type "y"
    And I type "n"
    And I type ""
    Then the output should contain:
      """
       Nothing to do here
      """
