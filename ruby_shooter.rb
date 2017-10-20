require_relative 'ruby_shooter/view/view'
require_relative 'ruby_shooter/model/model'
require_relative 'ruby_shooter/controller/controller'

class RubyShooter
    def self.run
        game_model = Model.new
        game_view = View.new(game_model)
        game_controller = Controller.new(game_model)

        game_model.add_observer(game_view)
        game_model.add_observer(game_controller)

        game_model.run
    end
end

RubyShooter.run