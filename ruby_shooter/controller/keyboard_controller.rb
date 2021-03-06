require 'rubygame'
require_relative 'command'
require_relative 'controller'

class KeyboardController < Controller
  def initialize(game_model)
    super(game_model)
  end

  def update
    @event_queue.each do |event|
      case event
      when Rubygame::Events::QuitRequested
        @game_model.register_command(StopCommand.new(@game_model))
      when Rubygame::Events::KeyPressed
        at_keypress(event.key)
      end
    end
  end

  private

  def at_keypress(key)
    case key
    when :w
      @game_model.register_command(MoveCannonUpCommand.new(@game_model))
    when :s
      @game_model.register_command(MoveCannonDownCommand.new(@game_model))
    when :space
      @game_model.register_command(FireCannonCommand.new(@game_model))
    when :a
      @game_model.register_command(AimCannonUpCommand.new(@game_model))
    when :d
      @game_model.register_command(AimCannonDownCommand.new(@game_model))
    when :x
      @game_model.register_command(CannonForceUpCommand.new(@game_model))
    when :c
      @game_model.register_command(CannonForceDownCommand.new(@game_model))
    when :u
      @game_model.register_command(StepBackCommand.new(@game_model))
    when :q
      @game_model.register_command(StopCommand.new(@game_model))
    end
  end
end
