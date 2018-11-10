require 'spec_helper'
require './src/coordinate'

describe 'Coordinate class' do
  context 'initialization' do
    describe '#initialize' do
      it 'should initialize Coordinator class with x and y attrs' do
        coordinate = Coordinate.new(3, 5)
        expect(coordinate.x).to eq 3
        expect(coordinate.y).to eq 5
      end
    end
  end

  context 'behaviour' do
    describe '#to_s' do
      it 'should return a string' do
        coordinate = Coordinate.new(1, 2)
        expect(coordinate.to_s).to eq '1, 2'
      end
    end
  end
end
