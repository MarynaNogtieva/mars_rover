require './src/coordinate'

#########
# Direction class has four directions - North, South, East. West
# It can determine wich direction the rower is facing if the command was to turn right or left
# It can show wich coordinates to mobe by if we know the direction
#########

class Direction
  DIRECTIONS = %i[NORTH EAST SOUTH WEST].freeze

  LEFT_DIRECTIONS = {
    :NORTH => :EAST,
    :EAST => :SOUTH,
    :SOUTH => :WEST,
    :WEST => :SOUTH
  }.freeze

  RIGHT_DIRECTIONS ={
    :NORTH => :EAST,
    :EAST => :SOUTH,
    :SOUTH => :WEST,
    :WEST => :NORTH
  }.freeze

  class << self
    def direction_coordinate(direction)
      return nil if !DIRECTIONS.include?(direction)
      coordinate_hash = nil
      case direction
        when :NORTH
          coordinate_hash = { x: 0, y: 1 }
        when :SOUTH
          coordinate_hash = { x: 0, y: -1 }
        when :WEST
          coordinate_hash = { x: -1, y: 0 }
        when :EAST
          coordinate_hash = { x: 1, y: 0 }
      end
      coordinate_hash
    end

    # Rotate current direction of the rover by 90 degrees depending where it is supposed to turn
    # return symbol of the direction name i.e :NORTH
    def rotate_current_direction(rover_current_direction:, command_type: )
      return RIGHT_DIRECTIONS[rover_current_direction] if command_type == 'right'
      return LEFT_DIRECTIONS[rover_current_direction] if command_type == 'left'
    end
  end
end