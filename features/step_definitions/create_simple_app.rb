Given(/^I have created the app "(.*?)" with pah$/) do |app_name|
  app_exists = File.directory?("tmp/aruba/#{app_name}")

  if app_exists
    steps %Q(
      Then a directory named "#{app_name}" should exist
    )
  else
    steps %Q(
      When I run `rm -rf #{app_name}`
      Then I run `pah #{app_name}` interactively
      And I type "n"
      Then a directory named "#{app_name}" should exist
    )
  end
end
