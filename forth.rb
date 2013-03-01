#!/usr/bin/env ruby

require_relative "lib/parser"

parser = Forth::Parser.new

parser.on_output { |text| printf text }

puts parser.run(ARGF.read)
