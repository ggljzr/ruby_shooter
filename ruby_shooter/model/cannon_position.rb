require_relative 'position'

class CannonPosition < Position
    attr_reader :angle

    def initialize(x, y, angle = 0)
        super(x, y, :Cannon)
        @angle = angle
    end
end