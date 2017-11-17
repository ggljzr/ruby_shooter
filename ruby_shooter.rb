require_relative 'ruby_shooter/view/view'
require_relative 'ruby_shooter/model/model_proxy'

require_relative 'ruby_shooter/controller/mouse_controller'
require_relative 'ruby_shooter/controller/keyboard_controller'

class RubyShooter
    def self.run
        world_size_x = 500
        world_size_y = 500
        real_mode = ARGV.include?('real')

        game_model_proxy = ModelProxy.new(world_size_x, world_size_y, real_mode)
        game_view = View.new(game_model_proxy, world_size_x, world_size_y)

        if ARGV.include?('mouse')
            game_controller = MouseController.new(game_model_proxy)
        else
            game_controller = KeyboardController.new(game_model_proxy)
        end

        game_model_proxy.add_observer(game_view)
        game_model_proxy.add_observer(game_controller)

        game_model_proxy.run
    end
end

RubyShooter.run