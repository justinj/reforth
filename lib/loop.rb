module Forth
  module Loop
    def_word :DO do
      lower = pop
      upper = pop
      pointer_inc
      block = token_under_pointer
      add_loop(lower)
      (upper-lower).times do |i|
        run_block block[0]
        old = pop_loop
        add_loop(old + 1)
      end
      pop_loop
    end

    def_word :I do
      push loop_index
    end

    def_word :J do
      push second_loop_index
    end
  end
end
