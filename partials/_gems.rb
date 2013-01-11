puts "Installing gems... ".magenta

copy_static_file 'Gemfile'
run "gem install bundler --no-ri --no-rdoc"
run "bundle install"

git :add => 'Gemfile'
git :add => 'Gemfile.lock'
git :commit => "-qm 'Adding Gemfile.'"
rack_canonical = <<CANONICAL

#Run heroku config:add CANONICAL_HOST=yourdomain.com
#For more information, see: https://github.com/tylerhunt/rack-canonical-host#usage
use Rack::CanonicalHost, ENV['CANONICAL_HOST'] if ENV['CANONICAL_HOST']
CANONICAL
in_root do
  inject_into_file 'config.ru', rack_canonical, {after: "require ::File.expand_path('../config/environment',  __FILE__)", verbose: false}
end
git :add => 'config.ru'
git :commit => "-qm 'Adding rack-canonical-host.'"

puts "\n"
