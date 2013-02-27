module Forth
  def self.to_value(boolean)
    boolean ? 1 : 0
  end

  def self.truthy?(number)
    number != 0
  end
end
