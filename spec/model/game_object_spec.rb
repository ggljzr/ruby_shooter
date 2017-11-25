#!/usr/bin/env ruby
require_relative '../../ruby_shooter/model/game_object.rb'
require_relative '../spec_helper'

describe 'GameObject' do
  before(:each) do
    @game_object = GameObject.new(0, 0, 1) #object at 0,0 with radius 1
  end

  context 'Has expected methods' do
    it 'has collision methods' do
      expect(@game_object).to respond_to(:get_collision_dist)
      expect(@game_object).to respond_to(:get_collision)
    end

    it 'has get_type method' do
      expect(@game_object).to respond_to(:get_type)
    end

    it 'has check_bounds_method' do
      expect(@game_object).to respond_to(:check_bounds)
    end

    it 'is visitable' do
      expect(@game_object).to respond_to(:accept)
    end
  end

  context 'Bounds behavior' do
    it 'checks if within bounds' do
      #game_object is initializet at x = 0 y =0
      expect(@game_object.check_bounds(100, 100)).to be true
    end

    it 'checks if not within bounds' do
      out_of_bounds = GameObject.new(250, 250)
      expect(out_of_bounds.check_bounds(100, 100)).to be false

      out_of_bounds = GameObject.new(-10, 0)
      expect(out_of_bounds.check_bounds(100, 100)).to be false
    end
  end

  context 'Collision behavior' do
    before(:each) do
      @other_object = instance_double("GameObject", :x => 10, :y => 10, :r => 1)
    end

    it 'calculates distance between objects' do
      dist = @game_object.get_collision_dist(@other_object) #object at 0, 0
      expect(dist).to eq Math.sqrt(10**2 + 10**2)
    end

    it 'checks if objects are not coliding' do
      expect(@game_object.get_collision(@other_object)).to be false
    end

    it 'checks if objects are coliding' do
      @other_object = instance_double("GameObject", :x => 10, :y => 10, :r => 15)
      expect(@game_object.get_collision(@other_object)).to be true
    end
  end
end