require_relative 'game_object'
require_relative 'position'

class SimpleEnemyMove
  def get_next_position(enemy)
    Position.new(enemy.x, enemy.y, 0)
  end
end

class RealEnemyMove
  SPIN_RADIUS = 6 * Math::PI

  #angle je pouzitej jen tady pro
  #ten krouzivej pohyb, proto
  #enemy nema tridni promennou angle
  def initialize
    @angle = 0
  end

  def get_next_position(enemy)
    @angle += SPIN_RADIUS / 4 * 0.02 % SPIN_RADIUS
    new_x = enemy.x + Math.cos(@angle)
    new_y = enemy.y + Math.sin(@angle)
    Position.new(new_x, new_y, 0)
  end
end

class Enemy < GameObject
  RAND_STEP = 1
  SCARE_COEFICIENT = 5
  SCARE_SPEED = 3
  DISPERSION = 0.2

  def initialize(x = 0, y = 0, move_strategy = SimpleEnemyMove.new)
    super(x, y)
    @move_strategy = move_strategy
  end

  def move
    new_position = @move_strategy.get_next_position(self)
    @x = new_position.x
    @y = new_position.y
  end

  def move_away(missile)
    if get_collision_dist(missile) < @r * SCARE_COEFICIENT
      running_angle = missile.angle + rand(-DISPERSION..DISPERSION)
      @x += SCARE_SPEED * Math.cos(running_angle)
      @y += SCARE_SPEED * Math.sin(running_angle)
    end
  end
end
