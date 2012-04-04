module Checker
  module Modules
    class Haml
      def self.check
        files = Utils.files_modified
        files.delete_if {|f| f.ends_with?(".haml")}

        files.each do |f|
          puts "Checking #{f}..."
          system("haml --check #{f}")
        end
      end
    end
  end
end
