require_relative 'game_object'

class Missile < GameObject

    MISSILE_SPEED = 6

    def initialize(x = 0, y = 0, angle = 2 * Math::PI)
        super(x, y)
        @angle = angle
    end

    def move
        @x += MISSILE_SPEED * Math.cos(@angle)
        @y += MISSILE_SPEED * Math.sin(@angle)
    end
end