require_relative 'game_object'
require_relative 'missile'
require_relative 'cannon_position'

class Cannon < GameObject
    attr_accessor :angle

    def initialize(x = 0, y = 0)
        super(x, y)
        @angle = 0
    end

    def move_up
        @y -= 5
    end

    def move_down
        @y += 5
    end

    def aim_up
        @angle += 0.2
    end

    def aim_down
        @angle -= 0.2
    end

    def fire
        Missile.new(@angle, @x, @y)
    end

    def get_position
        CannonPosition.new(@angle, @x, @y)
    end
end