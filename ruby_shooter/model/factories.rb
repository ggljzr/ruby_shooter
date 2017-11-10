require_relative 'missile'
require_relative 'enemy'

class SimpleMissileFactory
  def create_missile(direction)
    Missile.new(direction.x, direction.y, direction.angle, SimpleMissileMove.new)
  end
end

class RealMissileFactory
  def create_missile(direction)
    Missile.new(direction.x, direction.y, direction.angle, RealMissileMove.new)
  end
end

class SimpleEnemyFactory
  def create_enemy(world_size_x, world_size_y)
    x = rand(world_size_x * 0.3..world_size_x * 0.9)
    y = rand(world_size_y * 0.1..world_size_y * 0.9)
    Enemy.new(x, y, SimpleEnemyMove.new)
  end
end

class RealEnemyFactory
  def create_enemy(world_size_x, world_size_y)
    x = rand(world_size_x * 0.3..world_size_x * 0.9)
    y = rand(world_size_y * 0.1..world_size_y * 0.9)
    Enemy.new(x, y, RealEnemyMove.new)
  end
end