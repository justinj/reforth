require_relative "math"
require_relative "core"

module Forth
  class Dictionary
    include Math
    include Core

    def initialize program
      @sender = program
    end

    def sender
      @sender
    end

    def pop
      @sender.pop
    end

    def push val
      @sender.push val
    end

    def run word
      instance_eval(&@@standard_words[word.to_sym])
    end
  end
end
