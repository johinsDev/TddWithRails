class Calculator

  attr_accessor :y

  def initialize(x , y)
    @x = x.to_f
    @y = y.to_f
  end

  def sum
    @x + @y
  end

  def divide
    raise ZeroDivisionError if isZero
    @x / @y
  end

  def isZero
    @y == 0
  end

  def multiply
    @x * @y
  end

end