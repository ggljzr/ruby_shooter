require 'rubygame'

require_relative 'command'
require_relative 'controller'

class MouseController < Controller
  def initialize(game_model)
    super(game_model)
  end

  def update
    @event_queue.each do |event|
      case event
      when Rubygame::Events::QuitRequested
        @game_model.register_command(StopCommand.new(@game_model))
      when Rubygame::Events::MouseMoved
        at_mouse_move(event.rel, event.buttons)
      when Rubygame::Events::MousePressed
        at_mouse_click(event.button)
      when Rubygame::Events::KeyPressed
        at_keypress(event.key)
      end
    end
  end

  private

  def at_mouse_click(button)
    case button
    when :mouse_left
      @game_model.register_command(FireCannonCommand.new(@game_model))
    when :mouse_wheel_up
      @game_model.register_command(CannonForceUpCommand.new(@game_model))
    when :mouse_wheel_down
      @game_model.register_command(CannonForceDownCommand.new(@game_model))
    end
  end

  def at_mouse_move(rel_position, buttons)
    if rel_position[1] < 0
      if buttons.include?(:mouse_right)
        @game_model.register_command(AimCannonUpCommand.new(@game_model))
      else
        @game_model.register_command(MoveCannonUpCommand.new(@game_model))
      end
    elsif rel_position[1] > 0
      if buttons.include?(:mouse_right)
        @game_model.register_command(AimCannonDownCommand.new(@game_model))
      else
        @game_model.register_command(MoveCannonDownCommand.new(@game_model))
      end
    end
  end

  def at_keypress(key)
    case key
    when :u
      @game_model.register_command(StepBackCommand.new(@game_model))
    when :q
      @game_model.register_command(StopCommand.new(@game_model))
    end
  end
end
