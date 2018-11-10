#########
# Coordinate class has values of x and y
# It's responsible to display current values,
# change them
#########
class Coordinate
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def to_s
    "#{@x}, #{@y}"
  end

  def change(x:, y:)
    @x += x
    @y += y
    self
  end
end
