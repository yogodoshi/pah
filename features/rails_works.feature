@no-clobber
Feature: Rails works
  Background:
    Given I have created the app "myapp" with pah

  Scenario: The rails works
    When I run `cp -r myapp myapp_with_controller`
    And I cd to "myapp_with_controller"
    And I run `ruby -e "Bundler.with_clean_env { system 'bundle exec rails g controller welcome index' }"`
    And I run `ruby -e "Bundler.with_clean_env { system 'bundle exec rails s' }"` interactively
    And I run `ruby -e "Bundler.with_clean_env { system 'sleep 15' }"`
    And I run `curl http://0.0.0.0:3000/welcome/index`
    And I run `ruby -e 'pid = %x(cat tmp/pids/server.pid); %x(kill -9 #{pid})'`
    Then the stdout should contain:
      """
      <h1>Welcome#index</h1>
      """


