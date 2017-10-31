require_relative 'game_object'
require_relative 'missile'
require_relative 'cannon_position'

class Cannon < GameObject
    attr_accessor :angle

    MOVE_STEP = 5
    AIM_STEP = 0.2

    def initialize(x = 0, y = 0)
        super(x, y)
        @angle = 0
    end

    def move_up
        @y -= MOVE_STEP
    end

    def move_down
        @y += MOVE_STEP
    end

    def aim_up
        @angle += AIM_STEP
    end

    def aim_down
        @angle -= AIM_STEP
    end

    def fire
        Missile.new(@x, @y, @angle)
    end

    def get_position
        CannonPosition.new(@x, @y, @angle)
    end
end