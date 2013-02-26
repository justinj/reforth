module Forth
  module ForthModule
    @@standard_words ||= {}
    def self.included(other)
      other.class.send(:define_method, :def_word) do |name, &block|
        raise "No block supplied to word definition" unless block
        @@standard_words[name] = block
      end
    end
  end
end
