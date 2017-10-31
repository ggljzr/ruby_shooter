class Position
    attr_reader :x, :y, :type

    def initialize(x, y, type)
        @x = x
        @y = y
        @type = type
    end
end