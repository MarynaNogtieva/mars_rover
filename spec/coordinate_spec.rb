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

    describe '#change' do
      before(:each) { @coordinate = Coordinate.new(0, 0) }

      it 'changes coordinate(0,0) to be (0,1)' do
        @coordinate.change(x: 0, y: 1)

        expect(@coordinate.x).to eq 0
        expect(@coordinate.y).to eq 1
      end
      it 'changes coordinate(0,0) to be (0,-1)' do
        @coordinate.change(x: 0, y: -1)

        expect(@coordinate.x).to eq 0
        expect(@coordinate.y).to eq -1
      end
      it 'changes coordinate(0,0) to be (1,0)' do
        @coordinate.change(x: 1, y: 0)

        expect(@coordinate.x).to eq 1
        expect(@coordinate.y).to eq 0
      end
      it 'changes coordinate(0,0) to be (-1,0)' do
        @coordinate.change(x: -1, y: 0)

        expect(@coordinate.x).to eq -1
        expect(@coordinate.y).to eq 0
      end

      it 'should return same object' do
        coordinate =  @coordinate.change(x: 2, y: 1)
        expect(@coordinate.object_id).to eq coordinate.object_id
      end
    end
  end
end
