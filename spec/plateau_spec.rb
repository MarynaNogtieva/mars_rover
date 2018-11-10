require 'spec_helper'

describe 'Plateau class' do
  context 'initialization' do
    describe '#initialize' do
      it 'should initialize Plateau class bottom left and to right coordinates' do
        plateau = Plateau.new(3, 5)
        expect(plateau.top_right_coordinate.x).to eq 3
        expect(plateau.top_right_coordinate.y).to eq 5
        expect(plateau.bottom_left_coordinate.x).to eq 0
        expect(plateau.bottom_left_coordinate.y).to eq 0
      end
    end
  end
end

