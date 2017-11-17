require_relative 'game_object'
require_relative 'position'

class StateSingle
  def get_missile_directions(cannon)
    cannon.state = StateDouble.new
    [Position.new(cannon.x, cannon.y, cannon.angle)]
  end
end

class StateDouble
  DISPERSION = 0.2

  def get_missile_directions(cannon)
    cannon.state = StateSingle.new
    r = Position.new(cannon.x, cannon.y, cannon.angle - DISPERSION)
    l = Position.new(cannon.x, cannon.y, cannon.angle + DISPERSION)
    [r, l]
  end
end

#este treba udelat to force pro ten vystrel

class Cannon < GameObject
  attr_reader :angle, :force
  attr_accessor :state

  MOVE_STEP = 5
  AIM_STEP = 0.2
  MAX_FORCE = 3

  def initialize(x = 0, y = 0)
    super(x, y)
    @state = StateDouble.new
    @angle = 0
    @force = 0
  end

  def move_up
    @y -= MOVE_STEP
  end

  def move_down
    @y += MOVE_STEP
  end

  def aim_up
    @angle += AIM_STEP
  end

  def aim_down
    @angle -= AIM_STEP
  end

  def force_up
    @force += 1 if @force < MAX_FORCE
  end

  def force_down
    @force -= 1 if @force > 0
  end

  def fire(missile_factory)
    dirs = @state.get_missile_directions(self)
    new_missiles = []
    dirs.each { |d| new_missiles << missile_factory.create_missile(d) }
    new_missiles
  end
end
