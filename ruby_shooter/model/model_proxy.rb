require_relative 'model'

#tu muzu udelat asi treba to logovani
#von v ty proxy ale taky zadnou logiku
#navic nemel

#rikal logovani nebo nakou kontrolu parametru no
#(nebo tu kontrolu toho screen_size rozsahu)

#zeptat se, jestli ten observer ma bejt u toho
#modelu nebo tady, ale tady asi ne
class ModelProxy

  def initialize(world_size_x = 500, world_size_y = 500, real_mode = false)
    @game_model = Model.new(world_size_x, world_size_y, real_mode)
  end

  def register_command(command)
    @game_model.register_command(command)
  end

  def step_back
    @game_model.step_back
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

  def cannon_force_up
    @game_model.cannon_force_up
  end

  def cannon_force_down
    @game_model.cannon_force_down
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

    p 'Starting game'
    @game_model.run
  end

  def stop
    p 'Stopping game'
    #nebo tady udelat nakej update high scores
    @game_model.stop
  end

end
