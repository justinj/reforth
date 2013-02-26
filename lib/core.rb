# Functions core to the Forth language, but don't necessarily fit in another
# category.

module Forth
  module Core
    include ForthModule
    def_word :"." do
      sender.output(pop.to_s)
    end

    def_word :DUP do
      a = pop
      push a
      push a 
    end
  end 
end
