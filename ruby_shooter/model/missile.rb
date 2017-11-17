require_relative 'game_object'
require_relative 'position'

#rakety by si mohly drzet cas vytvoreni
#a ten pak pouzivat pro vypocet ty drahy

class MissileMoveStrategy
  BASE_MISSILE_SPEED = 6
  GRAVITY = 5
end

class SimpleMissileMove < MissileMoveStrategy
  def get_next_position(missile)
    t = Time.now - missile.spawn_time #time since spawn in seconds

    speed = BASE_MISSILE_SPEED + missile.force

    new_x = speed * Math.cos(missile.angle) + missile.x
    new_y = speed * Math.sin(missile.angle) + missile.y
    new_angle = missile.angle

    new_y += GRAVITY * t**2

    Position.new(new_x, new_y, new_angle)
  end
end

class RealMissileMove < MissileMoveStrategy

  DRAWBACK = 2

  def get_next_position(missile)
    t = Time.now - missile.spawn_time

    speed = BASE_MISSILE_SPEED + missile.force

    new_x = speed * Math.cos(missile.angle) + missile.x
    new_y = speed * Math.sin(missile.angle) + missile.y
    new_angle = missile.angle

    new_y += GRAVITY * t**2
    new_x -= DRAWBACK

    Position.new(new_x, new_y, new_angle)
  end
end

class Missile < GameObject
  attr_reader :angle, :spawn_time, :force

  def initialize(x = 0, y = 0, angle = 0, force = 0, move_strategy = SimpleMissileMove.new)
    super(x, y)
    @angle = angle
    @force = force
    @move_strategy = move_strategy
    @spawn_time = Time.now
  end

  def move
    new_position = @move_strategy.get_next_position(self)
    @x = new_position.x
    @y = new_position.y
    @angle = new_position.angle
  end
end
