require './src/command'

#########
# TODO: add description
#########
class Rover
  attr_accessor :current_coordinate, :current_direction, :plateau

  def initialize(coordinate, direction, plateau)
    @current_coordinate = coordinate
    @current_direction = direction
    @plateau = plateau
  end

  def turn_right
    self.current_direction = Command.get_new_direction(current_direction, Command.right)
  end

  def turn_left
    self.current_direction = Command.get_new_direction(current_direction, Command.left)
  end

  def make_a_move
    new_coordinate_values = Command.get_new_coordinate_values(current_direction)
    potential_new_coordinate = current_coordinate.add_values(
                                new_x: new_coordinate_values[:x],
                                new_y: new_coordinate_values[:y]
                              )
    if can_move?(plateau, potential_new_coordinate)
      self.current_coordinate = current_coordinate.change(x: new_coordinate_values[:x], y: new_coordinate_values[:y])
    end
  end

  def to_s
    "#{current_coordinate.to_s} #{current_direction}"
  end

  private

  def can_move?(plateau, potential_new_coordinate)
    plateau.in_boundaries?(potential_new_coordinate[:x], potential_new_coordinate[:y])
  end
end