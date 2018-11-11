require './src/direction'
class Command
  class << self
    def right
      'R'
    end

    def left
      'L'
    end

    def move
      'M'
    end

    def get_new_direction(current_direction, turn_command)
      Direction.rotate_current_direction(current_direction: current_direction, command_type: turn_command)
    end

    def get_new_coordinate_values(direction_name)
      Direction.direction_coordinate(direction_name)
    end
  end
end