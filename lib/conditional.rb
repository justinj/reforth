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
  end
end
