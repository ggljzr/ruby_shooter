#!/usr/bin/env ruby
require_relative '../../ruby_shooter/model/enemy.rb'
require_relative '../spec_helper'

describe 'Enemy' do
    before(:each) do
        @enemy = Enemy.new(0, 0)
        @real_enemy = Enemy.new(0, 0, RealEnemyMove.new)
    end
    
    context 'Has expected methods' do
        it 'has move method' do
            expect(@enemy).to respond_to(:move)
        end

        it 'has move_away method' do
            expect(@enemy).to respond_to(:move_away)
        end
    end

    context 'Moving behavior' do
        it 'does not move when simple' do
            old_x = @enemy.x
            old_y = @enemy.y

            @enemy.move
            expect(@enemy.x).to eq old_x
            expect(@enemy.y).to eq old_y
        end

        it 'moves when real' do
            old_x = @real_enemy.x
            old_y = @real_enemy.y

            @real_enemy.move
            expect([@real_enemy.x, @real_enemy.y]).not_to eq [old_x, old_y]
        end

        it 'moves away from missiles' do
            old_x = @enemy.x
            old_y = @enemy.y
            missile = instance_double("Missile", :x => @enemy.r - 1, :y => old_y, :angle => 0)
            @enemy.move_away(missile)
            expect(@enemy.x).to be > old_x
            expect(@enemy.y).not_to eq old_y
        end
    end
end