puts "Configuring Unicorn... ".magenta

unicorn_configuration = <<UNICORN_CONFIGURATION
# Run GC each 10 requests
require "unicorn/oob_gc"
use Unicorn::OobGC, 10

# Unicorn Worker Killer Configuration:
#
require "unicorn/worker_killer"

# Max requests per worker
max_request_min =  ENV['MAX_REQUEST_MIN'].to_i || 3072
max_request_max =  ENV['MAX_REQUEST_MAX'].to_i || 4096
use Unicorn::WorkerKiller::MaxRequests, max_request_min, max_request_max

# Max memory size (RSS) per worker
oom_min = ((ENV['OOM_MIN'].to_i || 192) * (1024**2))
oom_max = ((ENV['OOM_MAX'].to_i || 216) * (1024**2))
use Unicorn::WorkerKiller::Oom, oom_min, oom_max
UNICORN_CONFIGURATION

in_root do
  inject_into_file 'config.ru', unicorn_configuration, {before: "require ::File.expand_path('../config/environment',  __FILE__)", verbose: false}
end

git :add => 'config.ru'
git :commit => "-qm 'Configuring Unicorn.'"

puts "\n"
