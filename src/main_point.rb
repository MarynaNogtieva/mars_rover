
require './src/rover'
require './src/coordinate'
require './src/plateau'

#######
# MainPoint class responsible for making plateau and rovers
# and initializeing operations for moving
# and getting info from each rover about it's current location and direction
#######
class MainPoint
  attr_reader :file_path, :plateau, :rovers
  def initialize(file_path, plateau)
    @file_path = file_path
    @plateau = plateau
    @rovers = []
  end

  PlateauTopCoortinate = Struct.new(:x, :y)
  RoverStrcut = Struct.new(:x, :y, :direction)

  def read_file
    rover = nil
    File.open(file_path,'r').each_with_index do |line, index|
      if index.zero?
        make_plateau(line)
      elsif index % 2 == 0
        start_rover(rover, line)
      elsif index %2 == 1
        rover = make_new_rover(line)
        rovers << rover
      end
    end
  end

  def make_plateau(line)
    plateau_coordiante = get_plateau_top_values(line)
    self.plateau.top_right_coordinate.x = plateau_coordiante.x.to_i
    self.plateau.top_right_coordinate.y = plateau_coordiante.y.to_i
    plateau
  end

  def make_new_rover(line)
    return nil if !can_create_rover?(line)
    rover_data = get_rover_measurements(line)
    Rover.new(Coordinate.new(rover_data.x, rover_data.y), rover_data.direction, plateau)
  end

  def start_rover(rover, line)
    return nil if rover.nil?
    command_line = line.gsub('\n','').split('')
    command_line.each do |letter|
      case letter.upcase
      when 'R'
        rover.turn_right
      when 'L'
        rover.turn_left
      when 'M'
        rover.make_a_move
      end
    end
    rover
  end

  def show_rovers_values
    rovers.each do |rover|
      puts rover.to_s
    end
  end

  private

  def get_plateau_top_values(line)
    first_line = line.split(' ')
    PlateauTopCoortinate.new(first_line[0], first_line[1])
  end

  def get_rover_measurements(line)
    input_data = line.split(' ')
    RoverStrcut.new(input_data[0].to_i, input_data[1].to_i, input_data[2].upcase)
  end

  def can_create_rover?(line)
    input_data = line.split(' ')
    input_data.length == 3
  end
end