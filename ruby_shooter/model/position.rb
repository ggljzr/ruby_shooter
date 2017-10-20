class Position
    attr_reader :type, :x, :y

    def initialize(type, x = 0, y = 0)
        @x = x
        @y = y
        @type = type
    end
end