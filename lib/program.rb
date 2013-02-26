require_relative "dictionary"

module Forth
  class Program
    def initialize
      @stack = []
      @current_output = ""
      @dictionary = Dictionary.new self
    end

    def run(tokens)
      @output = ""
      tokens.each do |token|
        if number? token
          push(token)
        else
          @dictionary.run(token)
        end 
      end
      @output
    end

    def output text
      @output += " " unless @output == ""
      @output << text 
    end

    def number?(token)
      /\d+/ =~ token 
    end

    def push(value)
      @stack << value.to_i
    end

    def pop
      @stack.pop
    end
  end
end
