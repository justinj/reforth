module Forth
  module Loop
    def_word :DO do
      lower = pop
      upper = pop
      pointer_inc
      block = token_under_pointer
      (upper-lower).times do
        run_block block[0]
      end
    end
  end
end
