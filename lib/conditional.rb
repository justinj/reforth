# Functions relating to comparison and conditionals

require_relative "forth_module"

module Forth
  module Conditional
    include ForthModule
    def truthify(value)
      value ? 1 : 0 
    end

    def truthy?(value)
      value != 0
    end

    def_word :"=" do
      a = pop
      b = pop
      push truthify(a == b)
    end

    def_word :">" do
      a = pop
      b = pop
      push truthify(b > a)
    end

    def_word :"<" do
      a = pop
      b = pop
      push truthify(b < a)
    end

    def_word :"0=" do
      a = pop
      push truthify(a == 0)
    end

    def_word :OR do
      a = pop
      b = pop
      push truthify(truthy?(a) || truthy?(b))
    end

    def_word :AND do
      a = pop
      b = pop
      push truthify(truthy?(a) && truthy?(b))
    end

    def_word :IF do
      a = pop
      pointer_inc
      block = token_under_pointer
      if truthy?(a)
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
