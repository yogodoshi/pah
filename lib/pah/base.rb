module Pah
  class Base < Rails::Generators::Base
    include Singleton

    def template_root
      File.expand_path(File.join('..', 'pah'), File.dirname(__FILE__))
    end

    def partials
      File.join(template_root, 'templates')
    end

    def apply_n(partial_name, message='')
      puts message.magenta
      puts template_root.red

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
