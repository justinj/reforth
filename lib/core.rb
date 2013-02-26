# Functions core to the Forth language, but don't necessarily fit in another
# category.

module Forth
  module Core
    def dot
      sender.output(sender.pop.to_s)
    end
  end 
end
