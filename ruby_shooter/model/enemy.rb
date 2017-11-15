require_relative 'game_object'
require_relative 'direction'

class SimpleEnemyMove
  def get_next_position(enemy, missile)
    Direction.new(enemy.x, enemy.y, 0)
  end
end

class RealEnemyMove
  RAND_STEP = 1
  SCARE_COEFICIENT = 2.5
  SCARE_SPEED = 3

  def get_next_position(enemy, missile)
    new_x = 0
    new_y = 0

    if enemy.get_collision_dist(missile) < enemy.r * SCARE_COEFICIENT
      running_angle = missile.angle + rand(-0.2..0.2)
      new_x = SCARE_SPEED * Math.cos(running_angle) + enemy.x
      new_y = SCARE_SPEED * Math.sin(running_angle) + enemy.y
    else
      new_x += rand(-RAND_STEP..RAND_STEP) + enemy.x
      new_y += rand(-RAND_STEP..RAND_STEP) + enemy.y
    end
    Direction.new(new_x, new_y, 0)
  end
end

class Enemy < GameObject
  def initialize(x = 0, y = 0, move_strategy = SimpleEnemyMove.new)
    super(x, y)
    @move_strategy = move_strategy
  end

  def move(missile)
    new_position = @move_strategy.get_next_position(self, missile)
    @x = new_position.x
    @y = new_position.y
  end
end
