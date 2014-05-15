Then(/^I have a created repo$/) do
  pathname = pathname_from_app('.git')
  expect(pathname).to be_exist
end
