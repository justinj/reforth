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
      pointer_inc
      # ew ugly
      unless token_under_pointer.first.is_a? Array
        if_else = [token_under_pointer, []]
      else
        if_else = token_under_pointer
      end
      run_block if_else[a == 0 ? 1 : 0]
      pointer_inc
    end

    def_word :THEN do

    end
  end
end
