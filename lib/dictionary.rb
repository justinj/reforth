require_relative "math"

module Forth
  class Dictionary
    include Math

    def initialize program
      @program = program  
    end

    def run
      
    end

    SPECIAL_NAMES = {
      "." => "dot",
      "+" => "plus",
    }
    def rename token
      SPECIAL_NAMES.fetch(token, token)
    end
    private :rename

    def dot
      @program.output @program.pop.to_s
    end
  end
end
