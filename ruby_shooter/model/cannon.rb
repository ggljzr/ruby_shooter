require_relative 'game_object'
require_relative 'direction'

class StateSingle
  def get_missile_directions(cannon)
    cannon.state = StateDouble.new
    [Direction.new(cannon.x, cannon.y, cannon.angle)]
  end
end

class StateDouble
  def get_missile_directions(cannon)
    cannon.state = StateSingle.new
    r = Direction.new(cannon.x, cannon.y, cannon.angle - 0.2)
    l = Direction.new(cannon.x, cannon.y, cannon.angle + 0.2)
    [r, l]
  end
end

#este treba udelat to force pro ten vystrel

class Cannon < GameObject
  attr_reader :angle
  attr_accessor :state

  MOVE_STEP = 5
  AIM_STEP = 0.2

  def initialize(x = 0, y = 0)
    super(x, y)
    @state = StateDouble.new
    @angle = 0
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

  #von tam ma metodu fire a ty predava
  #referenci na tu missile factory
  #takze by to asi taky slo udelat
  #ze by to vracelo primo pole missiles
  #nebo ta missile factory by mohla
  #bejt i tridni promenna

  #to by tady pak asi nemusel vytvaret
  #ty directions ale vracet rovnou ty rakety
  def get_missile_directions
    @state.get_missile_directions(self)
  end
end
