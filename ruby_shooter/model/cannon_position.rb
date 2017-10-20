require_relative 'position'

class CannonPosition < Position
    attr_reader :angle

    def initialize(angle = 0, x = 0, y = 0, type = :Cannon)
        super(type, x, y)
        @angle = angle
    end
end