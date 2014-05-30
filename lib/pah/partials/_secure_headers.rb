content = <<EOF

  ensure_security_headers # See more: https://github.com/twitter/secureheaders
EOF

inject_into_file 'app/controllers/application_controller.rb', content, {after: "with: :exception", verbose: false}

create_file "config/initializers/secure_headers.rb" do
<<-EOF
::SecureHeaders::Configuration.configure do |config|
  config.hsts = {:max_age => 20.years.to_i, :include_subdomains => true}
  config.x_frame_options = 'DENY'
  config.x_content_type_options = "nosniff"
  config.x_xss_protection = {:value => 1, :mode => 'block'}
  config.csp = false
end
EOF
end
git add: 'app/controllers/application_controller.rb'
git add: 'config/initializers/secure_headers.rb'
git_commit 'Add secure headers.'
