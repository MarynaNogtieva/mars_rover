require 'spec_helper'

describe 'Rover class' do
  before(:each) do
    @current_coordinate = Coordinate.new(1, 2)
    @current_direction = 'N'
    @plateau = Plateau.new(Coordinate.new(0, 0), Coordinate.new(5, 5))
    @rover = Rover.new(@current_coordinate, @current_direction, @plateau)
  end

  describe '#initialize' do
    it 'should initialize Rover class with current direction, current position and plateau it should ride on' do
      expect(@rover.current_direction).to eq @current_direction
      expect(@rover.current_coordinate.x).to eq @current_coordinate.x
      expect(@rover.current_coordinate.y).to eq @current_coordinate.y
      expect(@rover.plateau).to eq @plateau
    end
  end

  describe '#turn_right' do
    it 'should alter current direction from N to E' do
      @rover.turn_right
      expect(@rover.current_direction).to eq 'E'
    end
  end

  describe '#turn_left' do
    it 'should alter current direction from N to W' do
      @rover.turn_left
      expect(@rover.current_direction).to eq 'W'
    end
  end

  describe '#make_a_move' do
    it 'should alter current coordinates depending on the current direction that is = W' do
      @rover.turn_left
      @rover.make_a_move
      expect(@rover.current_coordinate.x).to eq 0
      expect(@rover.current_coordinate.y).to eq 2
    end
  end

  describe '#to_s' do
    it 'should show current_coordinate and current_direction' do
      expect(@rover.to_s).to eq "#{@rover.current_coordinate.x} #{@rover.current_coordinate.y} #{@rover.current_direction}"
    end
  end
end

