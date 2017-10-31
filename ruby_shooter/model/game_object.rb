require_relative 'position'

class GameObject 
    attr_reader :x, :y, :r

    def initialize(x = 0, y = 0, r = 20)
        @x = x
        @y = y
        @r = r
    end

    def get_collision(other_object)
        dx = @x - other_object.x
        dy = @y - other_object.y
        dist = Math.sqrt(dx * dx + dy * dy)

        dist < (@r + other_object.r)
    end

    def get_position
        Position.new(@x, @y, self.class.to_s.to_sym)
    end
end

