require 'checker/utils'

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

  def ends_with?(patt)
    patt = Regexp.new(Regexp.escape(patt) + "$")
    self.match patt
  end
end

class Array
  def all_true?
    self.all? {|o| o == true}
  end
end
