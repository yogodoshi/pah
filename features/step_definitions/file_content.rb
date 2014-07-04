Then(/^I have the file(.* )and contents of this file should be:$/) do |file, content|
  file_content = read_from_app(file.strip)
  expect(file_content).to eq(content)
end

Then(/^I have the file(.* )and contents of this file should include:$/) do |file, content|
  file_content = read_from_app(file.strip)
  expect(file_content).to include(content)
end

Then(/^I have the file(.* )and contents of this file should not include:$/) do |file, content|
  file_content = read_from_app(file.strip)
  expect(file_content).to_not include(content)
end

Then(/^I have the file(.* )and contents of this file should match:$/) do |file, content|
  file_content = read_from_app(file.strip)
  expect(file_content).to match(%r{#{content}})
end
