require 'rubygame'

require_relative 'object_visitor'
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

    @object_visitor = ObjectVisitor.new(@drawer)
  end

  def update
    @bg.blit(@screen, [0, 0]) #clear the screen

    objects = @game_model.get_game_objects
    objects.each { |o| o.accept(@object_visitor)}
    @screen.update
  end

end
