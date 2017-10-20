require_relative 'game_object'

class Missile < GameObject

    def initialize(angle = 2 * Math::PI, x = 0, y = 0)
        super(x, y)
        @angle = angle
    end

    def move
        @x += 6 * Math.cos(@angle)
        @y += 6 * Math.sin(@angle)
    end
end