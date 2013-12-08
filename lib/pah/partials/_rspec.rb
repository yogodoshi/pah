puts "Setting up RSpec ... ".magenta

remove_dir 'test'

copy_static_file 'spec/spec_helper.rb'

%w{vcr.rb deferred_garbage_collection.rb http_basic_auth.rb matchers.rb uploaded_file.rb suppress_log.rb}.each do |component|
  copy_static_file "spec/support/#{component}"
end

git :add => '.'
git :commit => "--all -qm 'Configured RSpec.'"
puts "\n"
