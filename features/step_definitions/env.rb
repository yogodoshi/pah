Then(/^I have \.ruby\-version$/) do
  file_content = File.read('tmp/aruba/myapp/.ruby-version')
  expect(file_content).to eq("2.1.1\n")
end

Then(/^I have \.ruby\-gemset$/) do
  file_content = File.read('tmp/aruba/myapp/.ruby-gemset')
  expect(file_content).to eq("myapp\n")
end

Then(/^I have \.env$/) do
  file_content = File.read('tmp/aruba/myapp/.env')
  expect(file_content).to include('PORT: 3000')
  expect(file_content).to match(/SECRET_TOKEN: \w+/)
end
