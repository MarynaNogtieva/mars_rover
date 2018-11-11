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
    "#{x}, #{y}"
  end

  def change(x:, y:)
    self.x += x
    self.y += y
    self
  end

  def add_values(new_x:, new_y:)
    new_x = x + new_x
    new_y = y + new_y
    { x: new_x, y: new_y }
  end
end
