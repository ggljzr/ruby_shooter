#!/usr/bin/env ruby
require_relative '../../ruby_shooter/model/model.rb'
require_relative '../spec_helper'

describe 'Model' do
  before(:each) do
    @model = Model.new
  end

  context 'Has expected methods' do
    it 'has register_command' do
      expect(@model).to respond_to(:register_command)
    end

    it 'has notify_observers' do
      expect(@model).to respond_to(:notify_observers)
    end

    it 'has add_observer' do
      expect(@model).to respond_to(:add_observer)
    end

    it 'has get_game_objects' do
      expect(@model).to respond_to(:get_game_objects)
    end

    it 'has step_back' do
      expect(@model).to respond_to(:step_back)
    end

    it 'has marshal serialize methods' do
      expect(@model).to respond_to(:marshal_load)
      expect(@model).to respond_to(:marshal_dump)
    end

    it 'has cannon controll methods' do
      expect(@model).to respond_to(:move_cannon_up)
      expect(@model).to respond_to(:move_cannon_down)
      expect(@model).to respond_to(:aim_cannon_up)
      expect(@model).to respond_to(:aim_cannon_down)
      expect(@model).to respond_to(:cannon_force_up)
      expect(@model).to respond_to(:cannon_force_down)
      expect(@model).to respond_to(:fire_cannon)
    end
  end
end
