# Functions relating to defining methods

require_relative "forth_module"

module Forth
  module Functions
    def_word :":" do
      pointer_inc
      function = token_under_pointer
      name = function.first
      block = function.last[0]
      def_new_word(name, block)
    end 

    def_word :";" do
    end
  end
end
