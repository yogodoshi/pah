module Pah
  class Runner < Rails::Generators::Base

    def partials
      File.join(TEMPLATE_ROOT, 'templates')
    end

    def apply_n(partial_name, message='')
      puts message.magenta

      in_root do
        Bundler.with_clean_env do
          require "#{partials}/#{partial_name}"
          "::Pah::Templates::#{partial_name.to_s.classify}".constantize.new.call
        end
      end

      puts "\n"
    end
  end
end
