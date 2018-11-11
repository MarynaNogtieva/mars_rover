require 'spec_helper'

describe 'Rover class' do
  context 'initialization' do
    describe '#initialize' do
      it 'should initialize Rover class with current direction, current position and plateau it should ride on' do
        current_coordinate = Coordinate.new(1, 2)
        current_direction = 'N'
        plateau = Plateau.new(5, 5)
        rover = Rover.new(current_coordinate, current_direction, plateau)

        expect(rover.current_direction).to eq current_direction
        expect(rover.current_coordinate.x).to eq current_coordinate.x
        expect(rover.current_coordinate.y).to eq current_coordinate.y
        expect(rover.plateau).to eq plateau
      end
    end

    describe '#turn_right' do
      xit 'should alter current direction from N to W' do
      end
    end

    describe '#turn_left' do
      xit 'should alter current direction from N to E' do
      end
    end

    describe '#move' do
      xit 'should alter current coordinates depending on the current direction' do
      end
    end
  end
end

