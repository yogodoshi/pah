Then(/^I dont have a README\.rdoc$/) do
  pathname = pathname_from_app('README.rdoc')
  expect(pathname).to_not be_exist
end

Then(/^I dont have application\.html\.erb$/) do
  pathname = pathname_from_app('app/views/layouts/application.html.erb')
  expect(pathname).to_not be_exist
end
