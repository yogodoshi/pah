Feature: Run specs
  Background:
    Given I have created a app with pah

  Scenario: All specs passes
    When I cd to "myapp"
    And I run `ruby -e "Bundler.with_clean_env { system 'bundle exec rake' }"`
    Then the stdout should contain:
      """
      1 example, 0 failures, 1 pending
      """


