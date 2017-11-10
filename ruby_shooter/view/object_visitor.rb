class ObjectVisitor
  def initialize(drawer)
    @drawer = drawer
  end

  def visit(object)
    case object.get_type
    when :Cannon
      @drawer.draw_cannon(object)
    when :Enemy
      @drawer.draw_enemy(object)
    when :Missile
      @drawer.draw_missile(object)
    when :Score
      @drawer.draw_score(object)
    end
  end
end
