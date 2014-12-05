@no-clobber
Feature: Commands
  Scenario: --version prompts the versions
    When I run `pah --version`
    Then the output should contain:
      """
      Pah version: 0.0.17
      Rails version: 4.1.8
      Ruby version: 2.1.5
      """
  Scenario: -v prompts the versions
    When I run `pah -v`
    Then the output should contain:
      """
      Pah version: 0.0.17
      Rails version: 4.1.8
      Ruby version: 2.1.5
      """
  Scenario: without args prompt help
    When I run `pah`
    Then the output should contain:
      """
      Usage: pah <project_name> Creates a new rails application using project_name
                 [--version|-v] Prompts the pah, rails and ruby version
      """
