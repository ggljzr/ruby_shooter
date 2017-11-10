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

  def draw_sprite(image, x, y)
    rect = image.make_rect
    rect.x = x
    rect.y = y
    image.blit(@screen, rect)
  end

  def draw_cannon(cannon)
    deg = cannon.angle * 180 / Math::PI
    rot_cannon = @cannon_sprite.rotozoom(deg * -1, 1)
    draw_sprite(rot_cannon, cannon.x, cannon.y)
  end

  def draw_missile(missile)
    draw_sprite(@missile_sprite, missile.x, missile.y)
  end

  def draw_enemy(enemy)
    draw_sprite(@enemy_sprite, enemy.x, enemy.y)
  end

  def draw_score(score)
    text_surface = @font.render_utf8("Score: #{score.value}", true, @font_color)
    rect = text_surface.make_rect
    rect.x = score.x
    rect.y = score.y
    text_surface.blit(@screen, rect)
  end
end
