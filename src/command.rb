require './src/direction'
class Command
  class << self
    def right
      'R'
    end

    def left
      'L'
    end

    def move
      'M'
    end
  end
end