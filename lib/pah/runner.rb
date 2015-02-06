module Pah
  class Runner < Rails::Generators::Base

    def partials
      File.join(TEMPLATE_ROOT, 'templates')
    end

    def apply_n(partial_name, message = '')
      print message.green

      in_root do
        Bundler.with_clean_env do
          require "#{partials}/#{partial_name}"
          "::Pah::Templates::#{partial_name.to_s.classify}".constantize.new([], self.options).call
        end
      end
    end
  end
end
