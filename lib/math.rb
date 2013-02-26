# Functions relating to general math things.

module Forth
  module Math
    def +
      a = sender.pop
      b = sender.pop
      sender.push (a+b)
    end
  end
end
