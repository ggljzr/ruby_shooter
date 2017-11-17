require 'rubygame'
require_relative 'command'

class Controller
  def initialize(game_model)
    @game_model = game_model
    @event_queue = Rubygame::EventQueue.new
    @event_queue.enable_new_style_events
  end
end
