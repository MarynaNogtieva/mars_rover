require './src/coordinate'
require './src/command'

#########
# Direction class has four directions - North, South, East. West
# It can determine wich direction the rower is facing if the command was to turn right or left
# It can show wich coordinates to mobe by if we know the direction
#########

class Direction
  class << self
    def direction_coordinate(direction_name)
      direction = transform_direction_name(direction_name)
      return nil if !FULL_DIRECTIONS_NAMES.include?(direction)
      coordinate_hash = { x: 0, y: 0 }
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
    def rotate_current_direction(current_direction:, command_type: )
      direction = transform_direction_name(current_direction)
      return transform_direction_name(RIGHT_DIRECTIONS[direction]) if command_type == Command.right
      return transform_direction_name(LEFT_DIRECTIONS[direction]) if command_type == Command.left
    end

    private

    FULL_DIRECTIONS_NAMES = %i[NORTH EAST SOUTH WEST].freeze
    ALL_DIRECTIONS = {
      'N' => :NORTH,
      'S' => :SOUTH,
      'W' => :WEST,
      'E' => :EAST,
      :NORTH => 'N',
      :SOUTH => 'S',
      :WEST => 'W',
      :EAST => 'E'
    }.freeze

    LEFT_DIRECTIONS = {
      :NORTH => :WEST,
      :WEST => :SOUTH,
      :SOUTH => :EAST,
      :EAST => :NORTH
    }.freeze

    RIGHT_DIRECTIONS ={
      :NORTH => :EAST,
      :EAST => :SOUTH,
      :SOUTH => :WEST,
      :WEST => :NORTH
    }.freeze

    def transform_direction_name(direction_name)
      ALL_DIRECTIONS.fetch(direction_name, nil)
    end
  end
end