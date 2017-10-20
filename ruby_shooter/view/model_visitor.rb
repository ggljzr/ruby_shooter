require 'rubygame'

class ModelVisitor

    def initialize(drawer)
        @drawer = drawer
    end

    def visit(subject)
        @drawer.print_score(subject.score)

        sprite_positions = subject.get_sprites_positions

        sprite_positions.each do |position|
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
end