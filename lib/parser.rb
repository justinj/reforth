require_relative "program"

module Forth
  class Parser
    def initialize
      @program = Program.new
    end

    def run(code)
      tokens = tokenize(code) 
      @program.run(tokens)
    end 

    def tokenize(code)
      code = remove_comments(code)
      tokens = code.upcase.split(/\s+/)
      tokens = parse(tokens)
    end

    def remove_comments(code)
      code = code.gsub(/\(.*?\)/,"")
      code = code.gsub(/\\.*?\Z/,"")
    end

    def parse(tokens)
      tree = []
      until tokens.empty?
        token = tokens.shift
        return [tree] if ends_block?(token)
        return [tree] + parse(tokens) if mid_block?(token)
        tree << token
        tree << parse(tokens) if begins_block?(token)
        if begins_function_block?(token)
          tree << [tokens.shift, parse(tokens).first]
        end
      end
      tree
    end

    def on_output(&block)
      @program.on_output(&block)
    end

    def begins_block?(token)
      ["IF","DO","BEGIN"].include? token
    end

    def begins_function_block?(token)
      token == ":"
    end

    # some things, like ELSE, split up a block to two
    def mid_block?(token)
      token == "ELSE"
    end

    def ends_block?(token)
      ["THEN", "LOOP",";","UNTIL"].include? token
    end
  end
end
