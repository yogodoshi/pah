module Pah
  module Templates
    class Config < Pah::Template
      attr_reader :config

      def call
        if (Pah.configuration.heroku[:create?] = will_you_like_to? 'create Heroku apps?'.red)
          Pah.configuration.heroku[:deploy?] = will_you_like_to? 'deploy immediately?'.red

          Pah.configuration.heroku[:domain] = ask 'Add custom domain (customdomain.com) or leave blank:'.red

          create_heroku_app

          Pah.configuration.heroku[:collaborators] = ask "Add collaborators? Type the email's separated by comma (,):".red
        end
      end

      # heroku questions
      def create_heroku_app
        say 'Refreshing Heroku user credentials'.magenta
        unless system 'heroku auth:login'
          puts 'Could not login to Heroku, halting'
          exit
        end

        created = false
        until created
          Pah.configuration.heroku[:name] = ask "What do you want to call your Heroku app? (#{Pah.configuration.app_name.gsub('_', '')})".red
          Pah.configuration.heroku[:name] = Pah.configuration.app_name.gsub('_', '') if Pah.configuration.heroku[:name].blank?

          say "Creating Heroku app '#{Pah.configuration.heroku[:name]}.herokuapp.com'".magenta

          created = system "heroku create #{Pah.configuration.heroku[:name]}"

          unless created
            puts "Heroku '#{Pah.configuration.heroku[:name]}' app already exists or could not be created, please provide a new name"
          end
        end
      end
    end
  end
end
