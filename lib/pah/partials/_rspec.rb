copy_static_file 'spec/spec_helper.rb'
copy_static_file 'spec/factories_spec.rb'

%w{vcr.rb deferred_garbage_collection.rb http_basic_auth.rb matchers.rb uploaded_file.rb suppress_log.rb}.each do |component|
  copy_static_file "spec/support/#{component}"
end

rake_factory_specs = <<RAKE_FACTORY_SPECS

if defined?(RSpec)
  desc 'Run factory specs.'
  RSpec::Core::RakeTask.new(:factory_specs) do |t|
    t.pattern = './spec/factories_spec.rb'
  end

  task spec: :factory_specs
end
RAKE_FACTORY_SPECS

append_to_file 'Rakefile', rake_factory_specs

git add: 'spec/'
git add: 'Rakefile'
git_commit 'Configured RSpec.'