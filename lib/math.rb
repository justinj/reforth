# Functions relating to general math things.

require_relative "forth_module"

module Forth
  module Math
    include ForthModule
    def_word :+ do
      a = pop
      b = pop
      push(a + b)
    end

    def_word :- do
      a = pop
      b = pop
      push(b - a)
    end

    def_word :* do
      a = pop
      b = pop
      push(a * b)
    end

    def_word :/ do
      a = pop
      raise "division by 0" if a == 0
      b = pop
      push(b / a)
    end

    def_word :MOD do
      a = pop
      raise "division by 0" if a == 0
      b = pop
      push(b % a)
    end
  end
end
