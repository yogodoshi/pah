Given(/^I have created a app with pah$/) do
  steps %Q{
    When I run `pah myapp` interactively
    And I type "n"
    Then the output should contain:
      """
      CONGRATS! INSTALLATION COMPLETE!
      """
  }
end
