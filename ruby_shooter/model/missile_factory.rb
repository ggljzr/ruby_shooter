require_relative 'missile'

class SimpleMissileFactory
    def create_missile(direction)
        Missile.new(direction.x, direction.y, direction.angle, SimpleMove.new)
    end
end

class RealMissileFactory
    def create_missile(direction)
        Missile.new(direction.x, direction.y, direction.angle, RealMove.new)
    end
end