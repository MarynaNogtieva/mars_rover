require 'spec_helper'

describe 'Command class' do
  describe '.right' do
    it 'returns R' do
      expect(Command.right).to eq 'R'
    end
  end

  describe '.left' do
    it 'returns L' do
      expect(Command.left).to eq 'L'
    end
  end

  describe '.move' do
    it 'returns M' do
      expect(Command.move).to eq 'M'
    end
  end
end
