#!/usr/bin/env ruby

require_relative "lib/parser"


parser = Forth::Parser.new

parser.on_output { |text| printf text }

if ARGV.empty?
  until STDIN.eof?
    parser.run(gets)
    puts " ok"
  end
else
  # run file
  parser.run(ARGF.read)
end
