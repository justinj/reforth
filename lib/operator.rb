require_relative "forth_module"

module Forth
  module Operator
    def_word :SWAP do
      a = pop
      b = pop
      push a
      push b
    end
  end
end
