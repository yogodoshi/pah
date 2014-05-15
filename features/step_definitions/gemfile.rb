Then(/^I have rails (\d+)\.(\d+)\.(\d+)$/) do |major, minor, patch|
  gemfile = read_from_app('Gemfile')
  rails_version = "#{major}.#{minor}.#{patch}"
  expect(gemfile).to include("gem 'rails',                  '#{rails_version}'")
end
