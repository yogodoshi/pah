%w{colored}.each do |component|
  if Gem::Specification.find_all_by_name(component).empty?
    run "gem install #{component}"
    Gem.refresh
    Gem::Specification.find_by_name(component).activate
  end
end

require "rails"
require "colored"
require "bundler"

# Directories for template partials and static files
@template_root = File.expand_path(File.join(File.dirname(__FILE__)))
@partials     = File.join(@template_root, 'partials')
@static_files = File.join(@template_root, 'files')

# Copy a static file from the template into the new application
def copy_static_file(path)
  # puts "Installing #{path}...".magenta
  remove_file path
  file path, File.read(File.join(@static_files, path))
  # puts "\n"
end

def apply_n(partial)
  apply "#{@partials}/_#{partial}.rb"
end

def would_you_like?(question)
  return true if ENV['RAILS_TEMPLATE_TEST'] == 'true'
  answer = ask("#{question} [y,n]".red)
  case answer.downcase
    when "yes", "y"
      true
    when "no", "n"
      false
    else
      would_you_like?(question)
  end
end

def ask_unless_test(*params)
  ask(*params) unless ENV['RAILS_TEMPLATE_TEST'] == 'true'
end

puts "\n========================================================="
puts " Pah".yellow.bold
puts "=========================================================\n"

# TODO: timezone, Add rspec extensions

apply_n :git
apply_n :cleanup
apply_n :gems
apply_n :database
apply_n :rspec
apply_n :default
apply_n :secure_headers
apply_n :omniauth
apply_n :capybara
apply_n :generators
apply_n :canonical_host
apply_n :rvm
apply_n :finish

if ENV['RAILS_TEMPLATE_TEST'] == 'true'
  in_root do
    run "rake"
  end
end

apply_n :heroku

# apply_n :omniauth # TODO: add spec support files
                    # TODO: take care of facebook when user is not logged in on facebook (when app)
# TODO: extrair phone validator to gem

puts "\n========================================================="
puts " CONGRATS! INSTALLATION COMPLETE!".yellow.bold
puts "=========================================================\n\n\n"
def run_bundle; end
