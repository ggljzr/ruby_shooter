require_relative 'game_object'

class SimpleEnemyMove
    def move(enemy, missile)

    end
end

class RealEnemyMove
    RAND_STEP = 1
    SCARE_COEFICIENT = 2.5
    SCARE_SPEED = 3

    def move(enemy, missile)
        if enemy.get_collision_dist(missile) < enemy.r * SCARE_COEFICIENT
            running_angle = missile.angle + rand(-0.2..0.2)
            enemy.x += SCARE_SPEED * Math.cos(running_angle)
            enemy.y += SCARE_SPEED * Math.sin(running_angle)
        else
            enemy.x += rand(-RAND_STEP..RAND_STEP)
            enemy.y += rand(-RAND_STEP..RAND_STEP)
        end       
    end
end

class Enemy < GameObject
    attr_accessor :x, :y

    def initialize(x = 0, y = 0, move_strategy = SimpleEnemyMove.new)
        super(x, y)
        @move_strategy = move_strategy
    end

    def move(missile)
        @move_strategy.move(self, missile)
    end
end