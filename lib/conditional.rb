# Functions relating to comparison and conditionals

require_relative "forth_module"
require_relative "truthyness"

module Forth
  module Conditional
    include ForthModule
    def_word :"=" do
      a = pop
      b = pop
      push Forth::to_value(a == b)
    end

    def_word :">" do
      a = pop
      b = pop
      push Forth::to_value(b > a)
    end

    def_word :"<" do
      a = pop
      b = pop
      push Forth::to_value(b < a)
    end

    def_word :OR do
      a = pop
      b = pop
      push Forth::to_value(Forth::truthy?(a) || Forth::truthy?(b))
    end

    def_word :IF do
      a = pop
      pointer_inc
      block = token_under_pointer
      if a != 0
        run_block block[0]
      elsif block.count > 1
        run_block block[1]
      end
      pointer_inc
    end

    def_word :THEN do

    end
  end
end
