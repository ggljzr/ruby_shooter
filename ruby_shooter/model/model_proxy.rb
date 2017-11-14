require_relative 'model'

#tu muzu udelat asi treba to logovani
#von v ty proxy ale taky zadnou logiku
#navic nemel

#rikal logovani nebo nakou kontrolu parametru no
#(nebo tu kontrolu toho screen_size rozsahu)

class ModelProxy

  def initialize(world_size_x = 500, world_size_y = 500, real_mode = false)
    @game_model = Model.new(world_size_x, world_size_y, real_mode)
  end

  def move_cannon_up
    @game_model.move_cannon_up
  end

  def move_cannon_down
    @game_model.move_cannon_down
  end

  def aim_cannon_up
    @game_model.aim_cannon_up
  end

  def aim_cannon_down
    @game_model.aim_cannon_down
  end

  def fire_cannon
    @game_model.fire_cannon
  end

  def get_game_objects
    @game_model.get_game_objects
  end

  def add_observer(observer)
    @game_model.add_observer(observer)
  end

  def run
    if @game_model.running?
      p 'Game already running'
      return
    end

    @game_model.run
  end

  def stop
    #nebo tady udelat nakej update high scores
    @game_model.stop
  end

end
