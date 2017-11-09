require_relative 'game_object'

class MissileMoveStrategy
    MISSILE_SPEED = 6
end

class SimpleMissileMove < MissileMoveStrategy
    def move(missile)
        missile.x += MISSILE_SPEED * Math.cos(missile.angle)
        missile.y += MISSILE_SPEED * Math.sin(missile.angle)
    end
end

class RealMissileMove < MissileMoveStrategy

    ANGLE_FALLOFF = 0.01

    def move(missile)
        missile.x += MISSILE_SPEED * Math.cos(missile.angle)
        missile.y += MISSILE_SPEED * Math.sin(missile.angle)
        missile.angle += ANGLE_FALLOFF
    end
end

class Missile < GameObject
    attr_accessor :x, :y, :angle

    def initialize(x = 0, y = 0, angle = 2 * Math::PI, move_strategy = SimpleMissileMove.new)
        super(x, y)
        @angle = angle
        @move_strategy = move_strategy
    end

    def move
        @move_strategy.move(self)
    end
end