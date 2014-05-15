Then(/^I have correct database\.yml$/) do
  database_yml = read_from_app('config/database.yml')
  expect(database_yml).to include('database: myapp_development')
  expect(database_yml).to include('database: myapp_test')
end

Then(/^I have schema\.rb$/) do
  pathname = pathname_from_app('db/schema.rb')
  expect(pathname).to be_exist
end
