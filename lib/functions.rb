# Functions relating to defining methods

require_relative "forth_module"

module Forth
  module Functions
    def_word :":" do
      pointer_jump(pointer_loc + 1)
      def_new_word(token_under_pointer, pointer_loc)
      until token_under_pointer == ";"
        pointer_inc
      end
    end 

    def_word :";" do
      pointer_jump(pop_rstack)
    end
  end
end
