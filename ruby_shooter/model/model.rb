require_relative 'game_loop'

require_relative 'cannon'
require_relative 'factories'
require_relative 'score'

require_relative '../controller/controller'
require_relative '../utils/observable'

class Model
  include Observable, Visitable

  attr_reader :missiles, :enemies, :commands

  CANNON_START_X = 10
  CANNON_START_Y = 100

  MAX_ENEMIES = 8

  def initialize(world_size_x = 500, world_size_y = 500, real_mode = false)
    super()

    @world_size_x = world_size_x
    @world_size_y = world_size_y

    @cannon = Cannon.new(CANNON_START_X, CANNON_START_Y)

    if real_mode == true
      @entities_factory = RealEntitiesFactory.new
    else
      @entities_factory = SimpleEntitiesFactory.new
    end

    @commands = []

    @missiles = []
    @enemies = []

    @score = Score.new

    @game_loop = GameLoop.new(self)
  end

  def register_command(command)
    @commands << command
  end

  def cannon_force_up
    @cannon.force_up
  end

  def cannon_force_down
    @cannon.force_down
  end

  def move_cannon_up
    @cannon.move_up
  end

  def move_cannon_down
    @cannon.move_down
  end

  def aim_cannon_up
    @cannon.aim_up
  end

  def aim_cannon_down
    @cannon.aim_down
  end

  def get_game_objects
    objects = []

    objects << @cannon
    objects << @score
    @missiles.each { |m| objects << m}
    @enemies.each { |e| objects << e}

    objects
  end

  def fire_cannon
    @missiles.concat(@cannon.fire(@entities_factory))
  end

  def spawn_enemy
    if @enemies.length < MAX_ENEMIES
      @enemies << @entities_factory.create_enemy(@world_size_x, @world_size_y)
    end
  end

  def enemy_missile_collision(enemy, missile)
    @missiles.delete(missile)
    @enemies.delete(enemy)
    @score.inc
  end

  def remove_old_objects
    @missiles = @missiles.select { |m| m.check_bounds(@world_size_x, @world_size_y)}
    @enemies = @enemies.select { |e| e.check_bounds(@world_size_x, @world_size_y)}
  end

  def run
    @game_loop.run
  end

  def stop
    @game_loop.stop
  end

  def running?
    @game_loop.running?
  end
end
