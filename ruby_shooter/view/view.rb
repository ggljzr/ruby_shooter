require 'rubygame'

require_relative 'model_visitor'
require_relative 'graphics_drawer'


class View

    def initialize(game_model, screen_size_x = 500, screen_size_y = 500)
        
        @game_model = game_model
        
        @screen_size_x = screen_size_x
        @screen_size_y = screen_size_y

        @screen =  Rubygame::Screen.new([screen_size_y,screen_size_x], 
            0, [Rubygame::HWSURFACE, Rubygame::DOUBLEBUF])
        @screen.title = 'Ruby Shooter'

        @drawer = GraphicsDrawer.new(@screen)

        @bg = @drawer.bg
        @bg.blit(@screen, [0, 0])

        @model_visitor = ModelVisitor.new(@drawer)

    end

    def update
        @bg.blit(@screen, [0, 0]) #clear the screen
        @game_model.accept(@model_visitor)
        @screen.update
    end

end