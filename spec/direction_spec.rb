require 'spec_helper'

describe 'Direction class' do
  describe '.direction coordinate' do
    it 'returns coordinate (0, 1) for the North' do
      north_coordinate = Direction.direction_coordinate('N')

      expect(north_coordinate[:x]).to eq(0)
      expect(north_coordinate[:y]).to eq(1)
    end

    it 'returns coordinate (0, -1) for the South' do
      south_coordinate = Direction.direction_coordinate('S')

      expect(south_coordinate[:x]).to eq(0)
      expect(south_coordinate[:y]).to eq(-1)
    end

    it 'returns coordinate (-1, 0) for the West' do
      west_coordinate = Direction.direction_coordinate('W')

      expect(west_coordinate[:x]).to eq(-1)
      expect(west_coordinate[:y]).to eq(0)
    end

    it 'returns coordinate (1, 0) for the East' do
      east_coordinate = Direction.direction_coordinate('E')

      expect(east_coordinate[:x]).to eq(1)
      expect(east_coordinate[:y]).to eq(0)
    end

    it 'returns nil if wrong direction is passed' do
      wrong_coordinate = Direction.direction_coordinate('WRONG')
      expect(wrong_coordinate).to be nil
    end
  end

  describe '.rotate_current_direction'do
    it 'returns E for EAST if current direction is :NORTH and command type is right' do
      new_direction = Direction.rotate_current_direction(
                        current_direction: 'N',
                        command_type: Command.right
                      )
      expect(new_direction).to eq('E')
    end

    it 'returns W for WEST if current direction is :SOUTH and command type is left' do
      new_direction = Direction.rotate_current_direction(
                        current_direction: 'S',
                        command_type: Command.left
                      )
      expect(new_direction).to eq('W')
    end
  end
end
