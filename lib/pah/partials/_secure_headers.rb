puts "Adding secure headers... ".magenta
content = <<EOF

  ensure_security_headers # See more: https://github.com/twitter/secureheaders
EOF
in_root do
  inject_into_file 'app/controllers/application_controller.rb', content, {after: "with: :exception", verbose: false}
end
git :add => 'app/controllers/application_controller.rb'
git :commit => "-qm 'Adding secure headers.'"

puts "\n"
