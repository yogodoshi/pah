Then(/^I dont have a (.*)$/) do |file|
  pathname = pathname_from_app(file)
  expect(pathname).to_not be_exist
end

Then(/^I have a (.*)$/) do |file|
  pathname = pathname_from_app(file)
  expect(pathname).to be_exist
end
