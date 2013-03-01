require_relative "core"
require_relative "functions"
require_relative "math"
require_relative "conditional"
require_relative "loop"
require_relative "operator"

module Forth
  class Dictionary
    include Core
    include Functions
    include Math
    include Conditional
    include Loop
    include Operator

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
      @sender.sub_run(tokens)
    end

    def add_loop(value)
      @sender.loops << value
    end

    def pop_loop
      @sender.loops.pop
    end

    def loop_index
      @sender.loops.last
    end

    def second_loop_index
      @sender.loops[-2]
    end



    def def_new_word(name, block)
      @new_words[name.to_sym] = block
    end

    def run word
      if @new_words.has_key? word.to_sym
        run_block(@new_words[word.to_sym])
      elsif @@standard_words.has_key? word.to_sym
        instance_eval(&@@standard_words[word.to_sym])
      else
        raise "unrecognized word #{word}"
      end
    end
  end
end
