require_relative 'game_object'
require_relative 'direction'

class StateSingle
    def fire(cannon)
        cannon.state = StateDouble.new
        [Direction.new(cannon.x, cannon.y, cannon.angle)]
    end
end

class StateDouble
    def fire(cannon)
        cannon.state = StateSingle.new
        r = Direction.new(cannon.x, cannon.y, cannon.angle - 0.2)
        l = Direction.new(cannon.x, cannon.y, cannon.angle + 0.2)
        [r, l]
    end
end

class Cannon < GameObject
    attr_reader :angle
    attr_accessor :state

    MOVE_STEP = 5
    AIM_STEP = 0.2

    def initialize(x = 0, y = 0)
        super(x, y)
        @state = StateDouble.new
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
        @state.fire(self)
    end
end