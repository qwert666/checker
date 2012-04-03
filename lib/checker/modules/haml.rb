module Checker
  module Modules
    class Haml
      def self.check
        files = `git ls-files -- *.haml`.split("\n")
        files.each do |f|
          puts "Checking #{f}..."
          exec("haml --check #{f}")
        end
      end
    end
  end
end
