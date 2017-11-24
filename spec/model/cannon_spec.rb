#!/usr/bin/env ruby
require_relative '../../ruby_shooter/model/cannon.rb'
require_relative '../spec_helper'

describe 'Cannon' do
    before(:each) do
        @cannon = Cannon.new
        @factory_double = instance_double("SimpleEntitiesFactory")

        #force double mode on init
        @cannon.state = StateDouble.new
    end

    context 'Has expected methods' do
        it 'has move methods' do
            expect(@cannon).to respond_to(:move_up)
            expect(@cannon).to respond_to(:move_down)
        end

        it 'has aim methods' do
            expect(@cannon).to respond_to(:aim_up)
            expect(@cannon).to respond_to(:aim_down)
        end

        it 'has force controll methods' do
            expect(@cannon).to respond_to(:force_up)
            expect(@cannon).to respond_to(:force_down)
        end

        it 'has fire method' do
            expect(@cannon).to respond_to(:fire)
        end
    end

    context 'Fire missiles' do
        before(:each) do
            @factory_double = double("SimpleEntitiesFactory")
        end

        it 'fires two missiles on double mode' do
            expect(@factory_double).to receive(:create_missile).twice
            @cannon.fire(@factory_double)
        end

        it 'changes fire modes on fire' do 
            old_state = @cannon.state
            expect(@factory_double).to receive(:create_missile).twice

            @cannon.fire(@factory_double)
            expect(@cannon.state.class).not_to eq old_state.class
        end

        it 'fires one missile on single mode' do
            expect(@factory_double).to receive(:create_missile).exactly(3).times
            @cannon.fire(@factory_double) #fire in double mode
            @cannon.fire(@factory_double) #fire in single mode
        end

        it 'fires missiles in differen angles (double mode)' do
            first_missile_dir = nil
            second_missile_dir = nil

            #capture arguments passed to create_missile method
            expect(@factory_double).to receive(:create_missile) do |arg|
                first_missile_dir = arg
            end

            expect(@factory_double).to receive(:create_missile) do |arg|
                second_missile_dir = arg
            end
            @cannon.fire(@factory_double)

            expect(first_missile_dir.angle).to_not eq second_missile_dir.angle
        end
    end
end