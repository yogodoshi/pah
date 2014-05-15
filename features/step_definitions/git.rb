Then(/^I have a created repo$/) do
  pathname = Pathname.new('tmp/aruba/myapp/.git')
  expect(pathname.exist?).to be_true
end
