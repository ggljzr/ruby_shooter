require_relative '../utils/visitable'

class GameObject
  attr_reader :x, :y, :r

  include Visitable

  def initialize(x = 0, y = 0, r = 20)
    @x = x
    @y = y
    @r = r
  end

  def get_collision_dist(other_object)
    dx = @x - other_object.x
    dy = @y - other_object.y
    Math.sqrt(dx * dx + dy * dy)
  end

  def get_collision(other_object)
    dist = get_collision_dist(other_object)
    dist < (@r + other_object.r)
  end

  def get_type
    self.class.to_s.to_sym
  end
end
