require_relative 'ruby_shooter/view/view'
require_relative 'ruby_shooter/model/model'
require_relative 'ruby_shooter/controller/controller'

class RubyShooter
    def self.run
        world_size_x = 500
        world_size_y = 500
        real_mode = ARGV.include?('real')

        game_model = Model.new(world_size_x, world_size_y, real_mode)
        game_view = View.new(game_model, world_size_x, world_size_y)
        game_controller = Controller.new(game_model)

        game_model.add_observer(game_view)
        game_model.add_observer(game_controller)

        game_model.run
    end
end

RubyShooter.run