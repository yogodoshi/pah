puts "Adding letter_opener... ".magenta

letter_opener_config = <<LETTER_OPENER

  # Letter openner config
  config.action_mailer.delivery_method = :letter_opener
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
LETTER_OPENER

in_root do
  inject_into_file 'config/environments/development.rb', letter_opener_config, { before: /^end/, verbose: false }
end

git :add => 'config/environments/development.rb'
git :commit => "-qm 'Adding letter_opener config.'"

