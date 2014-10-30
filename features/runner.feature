@no-clobber
Feature: Run without errors

  In order to use pah, I need this to run
  without any error

  Scenario: Running pah with heroku
    When I run `pah myapp_on_heroku` interactively
    And I type "y"
    And I type "n"
    And I type "myapp.com"
    And I type ""
    And I type "jondoe@example.com, janedoe@example.com"
    Then the output should match:
      """
      running heroku config:set SECRET_KEY_BASE=\w{120} --app myapponheroku
      """
    Then the stdout should contain:
      """
      running heroku domains:add myapp.com --app myapponheroku
      """
    Then the stdout should contain:
      """
      running heroku sharing:add jondoe@example.com --app myapponheroku
      running heroku sharing:add janedoe@example.com --app myapponheroku
      """
    Then the stdout should contain:
      """
      running heroku config:set TZ=America/Sao_Paulo --app myapponheroku
      """
    Then the stdout should contain:
      """
      running heroku addons:add heroku-postgresql:dev --app myapponheroku
      """
    Then the stdout should contain:
      """
      running heroku addons:add pgbackups:auto-month --app myapponheroku
      """
    Then the stdout should contain:
      """
      running heroku addons:add logentries --app myapponheroku
      """
    Then the stdout should contain:
      """
      running heroku addons:add sendgrid:starter --app myapponheroku
      """
    Then the stdout should contain:
      """
      running heroku addons:add rollbar --app myapponheroku
      """
    Then the stdout should contain:
      """
      running heroku addons:add newrelic:stark --app myapponheroku
      """
    Then the stdout should contain:
      """
      running heroku addons:add librato --app myapponheroku
      """
    Then the output should contain:
      """
       CONGRATS! INSTALLATION COMPLETE!
      """

  Scenario: Running pah without heroku
    When I run `pah myapp_without_heroku` interactively
    And I type "n"
    Then the stdout should contain:
      """
      CONGRATS! INSTALLATION COMPLETE!
      """
