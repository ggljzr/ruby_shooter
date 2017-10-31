class ObjectVisitor
    def initialize(drawer)
        @drawer = drawer
    end

    def visit(object)
        position = object.get_position

        case position.type
            when :Cannon
                @drawer.draw_cannon(position)
            when :Enemy
                @drawer.draw_enemy(position)
            when :Missile
                @drawer.draw_missile(position)
        end
    end
end