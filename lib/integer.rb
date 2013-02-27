class Integer
  def forth_truthy?
    self != 0
  end
end

module Forth
  def self.true
    1
  end

  def self.false
    0
  end
end
