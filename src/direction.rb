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
      return nil if !DIRECTIONS.include?(direction)
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

    DIRECTIONS = %i[NORTH EAST SOUTH WEST].freeze

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
      puts "#{direction_name == 'NORTH'}"
      return case
        when direction_name.upcase == 'N'
          :NORTH
        when direction_name.upcase == 'S'
          :SOUTH
        when direction_name.upcase == 'W'
          :WEST
        when direction_name.upcase == 'E'
          :EAST
        when direction_name == :NORTH
          'N'
        when direction_name == :SOUTH
          'S'
        when direction_name == :WEST
          'W'
        when direction_name == :EAST
          'E'
        else
          nil
        end
    end
  end
end