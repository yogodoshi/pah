rack_timeout = <<RACK_TIMEOUT

use Rack::Timeout
RACK_TIMEOUT

in_root do
  inject_into_file 'config.ru', rack_timeout, {after: "require ::File.expand_path('../config/environment',  __FILE__)", verbose: false}
end

git add: 'config.ru'

copy_static_file 'config/initializers/rack_timeout.rb'
git add: 'config/initializers/rack_timeout.rb'

git_commit 'Add Rack::Timeout configuration.'
