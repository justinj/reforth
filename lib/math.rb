# Functions relating to general math things.

module Forth
  module Math
    def +
      a = sender.pop
      b = sender.pop
      sender.push (a + b)
    end

    def -
      a = sender.pop
      b = sender.pop
      sender.push(b - a)
    end

    def *
      a = sender.pop
      b = sender.pop
      sender.push(a * b)
    end

    def /
      a = sender.pop
      raise "division by 0" if a == 0
      b = sender.pop
      sender.push(b / a)
    end
  end
end
