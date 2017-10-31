class ObjectVisitor
    def initialize(drawer)
        @drawer = drawer
    end

    def visit(object)
        position = object.get_position

        case position.type
            when :Cannon
                @drawer.draw_cannon(position, object.angle)
            when :Enemy
                @drawer.draw_enemy(position)
            when :Missile
                @drawer.draw_missile(position)
            when :Score
                @drawer.draw_score(position, object.value)
        end
    end
end