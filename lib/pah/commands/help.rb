module Pah
  class Commands
    class Help
      BANNER = <<-HEREDOC
Usage: pah <project_name> Creates a new rails application using project_name
           [--version|-v] Prompts the pah, rails and ruby version
      HEREDOC

      def run(*)
        puts BANNER
      end

    end
  end
end
