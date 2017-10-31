require 'rubygame'

class GraphicsDrawer
    attr_accessor :bg

    def initialize(screen)
        @screen = screen

        @bg = Rubygame::Surface.load('ruby_shooter/resources/bg.png')
        
        @cannon_sprite = Rubygame::Surface.load('ruby_shooter/resources/cannon.png')
        @enemy_sprite = Rubygame::Surface.load('ruby_shooter/resources/enemy.png')
        @missile_sprite = Rubygame::Surface.load('ruby_shooter/resources/missile.png')

        Rubygame::TTF.setup
        @font = Rubygame::TTF.new("ruby_shooter/resources/DejaVuSans-Bold.ttf", 20)
        @font_color = [0xee, 0xee, 0x33]
    end

    def draw_sprite(image, position)
        rect = image.make_rect
        rect.x = position.x
        rect.y = position.y
        image.blit(@screen, rect)
    end

    def draw_cannon(position, angle)
        deg = angle * 180 / Math::PI
        rot_cannon = @cannon_sprite.rotozoom(deg * -1, 1)
        draw_sprite(rot_cannon, position)
    end

    def draw_missile(position)
        draw_sprite(@missile_sprite, position)
    end

    def draw_enemy(position)
        draw_sprite(@enemy_sprite, position)
    end

    def draw_score(position, score)
        text_surface = @font.render_utf8("Score: #{score}", true, @font_color)
        rect = text_surface.make_rect
        rect.x = position.x
        rect.y = position.y
        text_surface.blit(@screen, rect)
    end
end