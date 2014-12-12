module Pah
  module Templates
    class Config < Pah::Template
      attr_reader :config

      def call
        if create_heroku_app?
          deploy_to_heroku?
          add_custom_domain?

          create_app_on_heroku!

          add_collaborators?
        end
      end

      def create_app_on_heroku!
        heroku_login_or_halt!

        created = false
        until created
          how_do_you_want_to_name_the_app?

          say "Creating Heroku app '#{Pah.configuration.heroku[:name]}.herokuapp.com'".green

          created = system "heroku create #{Pah.configuration.heroku[:name]}"

          unless created
            puts "Heroku '#{Pah.configuration.heroku[:name]}' app already exists or could not be created, please provide a new name".yellow
          end
        end
      end

      private
      def heroku_login_or_halt!
        say 'Refreshing Heroku user credentials'.green
        unless system 'heroku auth:login'
          puts 'Could not login to Heroku, halting'.red
          exit
        end
      end

      def create_heroku_app?
        Pah.configuration.heroku[:create?] = will_you_like_to? 'create Heroku apps?'.green
      end

      def deploy_to_heroku?
        Pah.configuration.heroku[:deploy?] = will_you_like_to? 'deploy immediately?'.green
      end

      def add_custom_domain?
        answer = ask 'Add custom domain (customdomain.com) or leave blank:'.green
        Pah.configuration.heroku[:domain] = answer
      end

      def add_collaborators?
        answer = ask "Add collaborators? Type the email's separated by comma (,):".green
        Pah.configuration.heroku[:collaborators] = answer
      end

      def how_do_you_want_to_name_the_app?
        answer = ask "How do you want to name your Heroku app? (#{app_name})".green
        Pah.configuration.heroku[:name] = answer.presence || app_name
      end

      def app_name
        @app_name ||= Pah.configuration.app_name.gsub('_', '')
      end
    end
  end
end
