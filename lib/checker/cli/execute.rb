class CoreExt
  def self.constantize(camel_cased_word)
    names = camel_cased_word.split('::')
    names.shift if names.empty? || names.first.empty?

    constant = Object
    names.each do |name|
      constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
    end
    constant
  end
end

class String
  def constantize
    CoreExt.constantize(self)
  end
end

module Checker
  class CLI
    module Execute
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def execute
          command = ARGV[0]
          which   = ARGV[1]

          klass = "Checker::Modules::#{which.capitalize}"
          require "checker/modules/#{which.downcase}"
          klass.constantize.check
        end
      end
    end
  end
end
