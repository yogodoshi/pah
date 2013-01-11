puts "Add omniauth support ...".magenta

if would_you_like? "Add omniauth support? [y,n]".red
  %w{omniauth.rb}.each do |component|
    copy_static_file "config/initializers/#{component}"
  end

  gsub_file 'Gemfile', /# gem \'omniauth/, "gem 'omniauth"

  git :add => '.'
  git :commit => "-aqm 'Add omniauth support.'"
  puts "\n"
end