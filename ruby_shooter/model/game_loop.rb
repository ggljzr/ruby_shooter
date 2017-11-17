require 'rubygame'

class GameLoop

  attr_reader :running
  alias_method :running?, :running

  TARGET_FRAMERATE = 60

  def initialize(game_model)
    @game_model = game_model
    @running = false
    @clock = Rubygame::Clock.new
    @clock.target_framerate = TARGET_FRAMERATE
  end

  def run
    @running = true

    while @running
      @clock.tick

      @game_model.commands.each() { |c| c.execute if !c.executed }

      @game_model.spawn_enemy

      @game_model.missiles.each do |m|
        m.move
        @game_model.enemies.each do |e|
          e.move(m)
          @game_model.enemy_missile_collision(e, m) if e.get_collision(m)
        end
      end

      @game_model.remove_old_objects
      @game_model.notify_observers
    end
  end

  def stop
    @running = false
  end
end
