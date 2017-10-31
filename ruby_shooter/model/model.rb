require 'rubygame'

require_relative 'cannon'
require_relative 'missile'
require_relative 'enemy'

require_relative '../controller/controller'

require_relative '../utils/observable'

class Model
    include Observable, Visitable

    attr_reader :world_size_x, :world_size_y, :score, :cannon, :missiles, :enemies
    attr_accessor :running

    CANNON_START_X = 10
    CANNON_START_Y = 100

    TARGET_FRAMERATE = 30

    MAX_ENEMIES = 5

    def initialize(world_size_x = 500, world_size_y = 500)
        super()

        @world_size_x = world_size_x
        @world_size_y = world_size_y

        @cannon = Cannon.new(CANNON_START_X, CANNON_START_Y)
        @missiles = []
        @enemies = []

        @score = 0

        @clock = Rubygame::Clock.new
        @clock.target_framerate = TARGET_FRAMERATE

        @running = true
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

    def fire_cannon
        @missiles << @cannon.fire
    end

    def spawn_enemy
        @enemies << Enemy.new(rand(@world_size_x * 0.3..@world_size_x * 0.9),
                              rand(@world_size_y * 0.1..@world_size_y * 0.9))
    end

    def get_game_objects
        objects = []

        objects << @cannon
        @missiles.each { |m| objects << m}
        @enemies.each { |e| objects << e}
        
        objects
    end

    def run

        spawn_enemy

        while @running do

            @clock.tick

            if @enemies.length < MAX_ENEMIES
                spawn_enemy
            end

            @missiles.each do |m|

                if m.x < @world_size_x
                    m.move
                else
                    @missiles.delete(m)
                    next
                end

                @enemies.each do |e|
                    if e.get_collision(m)
                        @missiles.delete(m)
                        @enemies.delete(e)
                        @score += 1
                    end
                end

            end

            notify_observers
        end
    end
end