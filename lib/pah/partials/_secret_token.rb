puts "Replacing secret token with environment variable...".magenta

in_root do
  append_to_file '.env', "SECRET_TOKEN: #{SecureRandom::hex(60)}\n"

  gsub_file 'config/initializers/secret_token.rb', /config.secret_token = '(.*?)'/, "config.secret_token = ENV['SECRET_TOKEN']"
  gsub_file 'config/initializers/secret_token.rb', /config.secret_key_base = '(.*?)'/, "config.secret_key_base = ENV['SECRET_TOKEN']"
end

git :add => 'config/initializers/secret_token.rb'
git :add => '.env'
git :commit => "-qm 'Replace secret token with environment variable.'"

puts "\n"
