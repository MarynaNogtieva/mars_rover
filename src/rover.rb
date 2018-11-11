require './src/coordinate'
require './src/plateau'
require './src/direction'

#########
# Coordinate class has values of x and y
# It's responsible to display current values,
# change them
#########
class Rover
  attr_accessor :current_coordinate, :current_direction, :plateau

  def initialize(coordinate, direction, plateau)
    @current_coordinate = coordinate
    @current_direction = direction
    @plateau = plateau
  end
end