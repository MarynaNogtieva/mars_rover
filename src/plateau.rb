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

  # TODO: add check boundaries method
end