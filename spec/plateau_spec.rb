require 'spec_helper'

describe 'Plateau class' do
  before(:each) {@plateau = Plateau.new(Coordinate.new(0, 0), Coordinate.new(3, 5))}
  context 'initialization' do
    describe '#initialize' do
      it 'should initialize Plateau class bottom left and to right coordinates' do
        expect(@plateau.top_right_coordinate.x).to eq 3
        expect(@plateau.top_right_coordinate.y).to eq 5
        expect(@plateau.bottom_left_coordinate.x).to eq 0
        expect(@plateau.bottom_left_coordinate.y).to eq 0
      end
    end
  end

  context 'validation' do
    describe '#in_boundaries?' do
      it 'should return true if coordinates are inside boundaries' do
        expect(@plateau.in_boundaries?(2,4)).to be true
      end

      it 'should return false if coordinates are outside the boundaries' do
        expect(@plateau.in_boundaries?(4,4)).to be false
      end
    end
  end
end

