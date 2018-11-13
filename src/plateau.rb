require './src/coordinate'

#########
# Plateau class has top right and bottom left coordinates
# It should be responseble for checking if rover is inside the oundaries of the current plateau
#########
class Plateau
  attr_accessor :top_right_coordinate, :bottom_left_coordinate

  def initialize(bottom_coordinate, top_coordinate)
    @bottom_left_coordinate = bottom_coordinate
    @top_right_coordinate = top_coordinate
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