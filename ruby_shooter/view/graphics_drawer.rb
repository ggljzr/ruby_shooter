require 'rubygame'

class GraphicsDrawer
  attr_accessor :bg

  def initialize(screen)
    @screen = screen

    @bg = Rubygame::Surface.load('ruby_shooter/resources/bg.png')

    @cannon_sprites = [Rubygame::Surface.load('ruby_shooter/resources/cannon0.png'),
                       Rubygame::Surface.load('ruby_shooter/resources/cannon1.png'),
                       Rubygame::Surface.load('ruby_shooter/resources/cannon2.png'),
                       Rubygame::Surface.load('ruby_shooter/resources/cannon3.png')]
    @enemy_sprite = Rubygame::Surface.load('ruby_shooter/resources/enemy.png')
    @missile_sprite = Rubygame::Surface.load('ruby_shooter/resources/missile.png')

    Rubygame::TTF.setup
    @font = Rubygame::TTF.new("ruby_shooter/resources/DejaVuSans-Bold.ttf", 20)
    @font_color = [0xFF, 0x00, 0xFF]
  end

  def draw_sprite(image, x, y)
    rect = image.make_rect
    rect.x = x
    rect.y = y
    image.blit(@screen, rect)
  end

  def draw_cannon(cannon)
    deg = cannon.angle * 180 / Math::PI

    force_cannon_sprite = @cannon_sprites[0]

    if cannon.force.between?(0, @cannon_sprites.length - 1)
      force_cannon_sprite = @cannon_sprites[cannon.force]
    end

    rot_cannon = force_cannon_sprite.rotozoom(deg * -1, 1)
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
