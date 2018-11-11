require './src/coordinate'

#########
# Plateau class has top right and bottom left coordinates
# It should be responseble for checking if rover is inside the oundaries of the current plateau
#########
class Plateau
  attr_accessor :top_right_coordinate, :bottom_left_coordinate

  def initialize(x, y)
    @bottom_left_coordinate = Coordinate.new(0,0)
    @top_right_coordinate = Coordinate.new(x,y)
  end

  def in_boundaries?(x, y)
    valid_x?(x) && valid_y?(y)
  end

  private

  def valid_x?(x)
    x >= bottom_left_coordinate.x && x <= top_right_coordinate.x
  end

  def valid_y?(y)
    y >= bottom_left_coordinate.y && y <= top_right_coordinate.y
  end
end