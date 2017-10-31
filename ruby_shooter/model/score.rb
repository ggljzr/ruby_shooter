class Score < GameObject
    attr_reader :value

    def initialize(x = 0, y = 0)
        super(x, y)
        @value = 0
    end

    def reset
        @value = 0
    end

    def inc
        @value += 1
    end
end