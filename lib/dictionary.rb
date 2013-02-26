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

    def run word
      send(rename(word))       
    end

    SPECIAL_NAMES = {
      "." => "dot",
    }
    def rename word
      SPECIAL_NAMES.fetch(word, word)
    end
    private :rename
  end
end
