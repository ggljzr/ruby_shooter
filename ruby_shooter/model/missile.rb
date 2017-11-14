require_relative 'game_object'

#rakety by si mohly drzet cas vytvoreni
#a ten pak pouzivat pro vypocet ty drahy

class MissileMoveStrategy
  MISSILE_SPEED = 6
end

class SimpleMissileMove < MissileMoveStrategy
  #tady by este mohlo bejt ze misto pohybu tou raketou to bude
  #vracet jen jako novou pozici a raketou se bude hejbat
  #v tim move

  #ze misto move by mohlo bejt naky get_next_position
  #by pak nemusely bejt ty settery na x a y

  #to samy u enemy
  #jako tu navratovou hodnotu pouzit treba direction
  def move(missile)
    missile.x += MISSILE_SPEED * Math.cos(missile.angle)
    missile.y += MISSILE_SPEED * Math.sin(missile.angle)

    #freefall = 0.5 * gravity * time**2
    #newY = tempY - freefall

    #newX = newX - dragforce
  end
end

class RealMissileMove < MissileMoveStrategy

  ANGLE_FALLOFF = 0.01

  def move(missile)
    missile.x += MISSILE_SPEED * Math.cos(missile.angle)
    missile.y += MISSILE_SPEED * Math.sin(missile.angle)
    missile.angle += ANGLE_FALLOFF
  end
end

class Missile < GameObject
  attr_accessor :x, :y, :angle

  def initialize(x = 0, y = 0, angle = 2 * Math::PI, move_strategy = SimpleMissileMove.new)
    super(x, y)
    @angle = angle
    @move_strategy = move_strategy
  end

  def move
    @move_strategy.move(self)
  end
end
