module Checker
  class CLI
    module Execute
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def execute
          p ARGV
        end
      end
    end
  end
end
