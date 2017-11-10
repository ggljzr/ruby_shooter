require 'rubygame'

require_relative 'cannon'
require_relative 'factories'
require_relative 'score'

require_relative '../controller/controller'
require_relative '../utils/observable'

class Model
  include Observable, Visitable

  attr_reader :running

  CANNON_START_X = 10
  CANNON_START_Y = 100

  TARGET_FRAMERATE = 60

  MAX_ENEMIES = 8

  def initialize(world_size_x = 500, world_size_y = 500, real_mode = false)
    super()

    @world_size_x = world_size_x
    @world_size_y = world_size_y

    @cannon = Cannon.new(CANNON_START_X, CANNON_START_Y)

    if real_mode == true
      @missile_factory = RealMissileFactory.new
      @enemy_factory = RealEnemyFactory.new
    else
      @missile_factory = SimpleMissileFactory.new
      @enemy_factory = SimpleEnemyFactory.new
    end

    @missiles = []
    @enemies = []

    @score = Score.new

    @clock = Rubygame::Clock.new
    @clock.target_framerate = TARGET_FRAMERATE

    @running = false
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

  def get_cannon_x
    @cannon.x
  end

  def get_cannon_y
    @cannon.y
  end

  def fire_cannon
    directions = @cannon.get_missile_directions
    directions.each { |d| @missiles << @missile_factory.create_missile(d) }
  end

  def get_game_objects
    objects = []

    objects << @cannon
    objects << @score
    @missiles.each { |m| objects << m}
    @enemies.each { |e| objects << e}

    objects
  end

  def run
    spawn_enemy

    @running = true

    while @running
      @clock.tick

      if @enemies.length < MAX_ENEMIES
        spawn_enemy
      end

      @missiles.each do |m|
        if !m.x.between?(0, @world_size_x) or !m.y.between?(0, @world_size_y)
          @missiles.delete(m)
          next
        end

        m.move

        @enemies.each do |e|
          e.move(m)
          enemy_missile_collision(e, m) if e.get_collision(m)
          if !e.x.between?(0, @world_size_x) or !e.y.between?(0, @world_size_y)
            @enemies.delete(e)
          end
        end
      end

      notify_observers
    end
  end

  def stop
    @running = false
  end

  private

  def spawn_enemy
    @enemies << @enemy_factory.create_enemy(@world_size_x, @world_size_y)
  end

  def enemy_missile_collision(enemy, missile)
    @missiles.delete(missile)
    @enemies.delete(enemy)
    @score.inc
  end
end
