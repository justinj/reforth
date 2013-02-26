# Functions relating to comparison and conditionals

require_relative "forth_module"

module Forth
  module Conditional
    include ForthModule
    def_word :"=" do
      a = pop
      b = pop
      push (a == b) ? 1 : 0
    end

    def_word :IF do
      a = pop
      if a == 0
        depth = 1
        until matching_then(depth) || matching_else(depth)
          pointer_inc
          depth += 1 if token_under_pointer == "IF"
          depth -= 1 if token_under_pointer == "THEN"
        end
      end
    end

    def matching_then depth
      depth == 0 && token_under_pointer == "THEN"
    end

    def matching_else depth
      depth == 1 && token_under_pointer == "ELSE"
    end

    def_word :THEN do

    end
  end
end
