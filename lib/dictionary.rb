require_relative "core"
require_relative "functions"
require_relative "math"
require_relative "conditional"

module Forth
  class Dictionary
    include Core
    include Functions
    include Math
    include Conditional

    def initialize program
      @sender = program
      @new_words = {}
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

    def push_rstack val
      @sender.push_rstack val
    end

    def pop_rstack
      @sender.pop_rstack
    end

    def pointer_loc
      @sender.pointer_loc
    end

    def token_under_pointer
      @sender.current_token
    end

    def pointer_jump location
      @sender.pointer_jump location
    end

    def pointer_inc
      @sender.pointer_jump(@sender.pointer_loc + 1)
    end

    def run_block(tokens)
      @sender.run(tokens)
    end

    def def_new_word(name, location)
      @new_words[name.to_sym] = location
    end

    def run word
      if @new_words.has_key? word.to_sym
        push_rstack(pointer_loc)
        pointer_jump(@new_words[word.to_sym])
      elsif @@standard_words.has_key? word.to_sym
        instance_eval(&@@standard_words[word.to_sym])
      else
        raise "unrecognized word #{word}"
      end
    end
  end
end
