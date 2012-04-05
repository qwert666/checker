module Checker
  module Modules
    class Ruby
      def self.check
        files = Utils.files_modified
        files.delete_if {|f| !f.ends_with?(".rb")}

        files.map! do |f|
          puts "Checking #{f}..."
          Ruby.check_one(f)
        end

        files.all_true?
      end

      def self.check_one(file)
        if Utils.use_rvm?
          Utils.rvm_command("ruby -c #{file}")
        else
          Utils.command("ruby -c #{file}")
        end
      end
    end
  end
end
