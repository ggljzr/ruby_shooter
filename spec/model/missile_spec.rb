#!/usr/bin/env ruby
require_relative '../../ruby_shooter/model/missile.rb'
require_relative '../spec_helper'

describe 'Missile' do
    before(:each) do
        #create missile on pos [0, 0] with 0 angle
        @missile = Missile.new(0, 0, 0)
        @real_missile = Missile.new(0, 0, 0, 0, RealMissileMove.new)
    end

    context 'Has expected methods' do
        it 'has move method' do
            expect(@missile).to respond_to(:move)
        end
    end

    context 'Moving behavior' do
        it 'moves forward when moved' do
            old_x = @missile.x
            @missile.move
            expect(@missile.x).to be > old_x
        end

        it 'falls slightly when moving (simple strategy)' do
            old_y = @missile.y
            @missile.move
            expect(@missile.y).to be > old_y
        end

        it 'falls slightly when moving (real strategy)' do
            old_y = @real_missile.y
            @real_missile.move
            expect(@real_missile.y).to be > old_y
        end

        it 'moves slightly back (real strategy)' do
            @missile.move
            @real_missile.move
            expect(@real_missile.x).to be < @missile.x
        end

        it 'moves faster with bigger force' do
            force_missile = Missile.new(0, 0, 0, 5)
            @missile.move
            force_missile.move

            expect(force_missile.x).to be > @missile.x
        end
    end
end