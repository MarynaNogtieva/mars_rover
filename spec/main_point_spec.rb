require 'spec_helper'

describe 'MainPoint class' do

  before(:each) { @main_point = MainPoint.new('./spec/input_1_spec.txt') }

  context 'initialization' do
    describe '#initialize' do
      it 'should initialize main_point object' do
        expect(@main_point.file_path).to eq ('./spec/input_1_spec.txt')
      end
    end
  end

  context 'instance methods' do
    describe '#make_plateau' do
      it 'alter top right coordinates of plateau' do
        line = '4 3'
        plateau = @main_point.make_plateau(line)
        expect(plateau.top_right_coordinate.x).to eq 4
        expect(plateau.top_right_coordinate.y).to eq 3
      end
    end

    describe '#make_new_rover' do
      it 'should create a rover object with coordinates and direction' do
        line = '1 2 N'
        rover = @main_point.make_new_rover(line)
        expect(rover.current_coordinate.x).to eq 1
        expect(rover.current_coordinate.y).to eq 2
        expect(rover.current_direction).to eq 'N'
      end

      it 'should return nil if there is wrong data in a line' do
        line = '1 2'
        rover = @main_point.make_new_rover(line)
        expect(rover).to be nil
      end
    end

    describe '#start_rover' do
      it 'should manipulate rover and alter it\'s properties' do
        plateau_line = '5 5'
        plateau = @main_point.make_plateau(plateau_line)
        rover_line = '1 2 N'
        command_line = 'LMLMLMLMM'
        rover = @main_point.make_new_rover(rover_line)
        @main_point.start_rover(rover,  command_line)
        expect(rover.to_s).to eq '1 3 N'
      end

      it 'return nil if rover is nil' do
        rover_line = '1 2'
        command_line = 'LMLMLMLMM'
        rover = @main_point.make_new_rover(rover_line)
        expect(@main_point.start_rover(rover,  command_line)).to be nil
      end

      it 'return nil if there is plateau top right coordinates are 0 0' do
        plateau_line = '0 0'
        plateau = @main_point.make_plateau(plateau_line)
        rover_line = '1 2'
        command_line = 'LMLMLMLMM'
        rover = @main_point.make_new_rover(rover_line)
        expect(@main_point.start_rover(rover,  command_line)).to be nil
      end
    end

    describe '#show_rovers_values' do
      it 'shows coordinates and directions of all rovers on plateau' do
        @main_point.read_file
        @main_point.show_rovers_values
        expect(@main_point.rovers[0].to_s).to eq '1 3 N'
        expect(@main_point.rovers[1].to_s).to eq '5 1 E'
      end
    end
  end
end
