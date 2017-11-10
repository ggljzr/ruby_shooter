require 'rubygame'

class Controller
  def initialize(game_model)
    @game_model = game_model
    @event_queue = Rubygame::EventQueue.new
    @event_queue.enable_new_style_events
  end

  def update
    @event_queue.each do |event|
      case event
      when Rubygame::Events::QuitRequested
        @game_model.running = false
      when Rubygame::Events::KeyPressed
        at_keypress(event.key)
      end
    end
  end

  def at_keypress(key)
    case key
    when :w
      @game_model.move_cannon_up
    when :s
      @game_model.move_cannon_down
    when :space
      @game_model.fire_cannon
    when :a
      @game_model.aim_cannon_up
    when :d
      @game_model.aim_cannon_down
    when :q
      @game_model.stop
    end
  end
end
