require 'rubygame'

require_relative 'cannon'
require_relative 'missile'
require_relative 'enemy'

require_relative '../controller/controller'

require_relative '../utils/observable'
require_relative '../utils/visitable'

class Model
    include Observable, Visitable

    attr_reader :world_size_x, :world_size_y, :score
    attr_accessor :running

    def initialize(world_size_x = 500, world_size_y = 500)
        super()

        @world_size_x = world_size_x
        @world_size_y = world_size_y

        @cannon = Cannon.new(10, 100)
        @missiles = []
        @enemies = []

        @score = 0

        @clock = Rubygame::Clock.new
        @clock.target_framerate = 30

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

    def get_sprites_positions
        positions = []

        positions << @cannon.get_position
        @missiles.each { |m| positions << m.get_position}
        @enemies.each { |e| positions << e.get_position}
        
        positions
    end

    def run

        spawn_enemy

        while @running do

            @clock.tick

            if @enemies.length < 5
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