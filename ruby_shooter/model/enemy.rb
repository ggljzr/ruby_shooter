require_relative 'game_object'

class SimpleEnemyMove
    def move(enemy)

    end
end

class RealEnemyMove
    def move(enemy)
        enemy.x += rand(-5..5)
        enemy.y += rand(-5..5)
    end
end

class Enemy < GameObject
    attr_accessor :x, :y

    def initialize(x = 0, y = 0, move_strategy = SimpleEnemyMove.new)
        super(x, y)
        @move_strategy = move_strategy
    end

    def move
        @move_strategy.move(self)
    end
end