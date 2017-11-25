#!/usr/bin/env ruby
require_relative '../../ruby_shooter/model/score.rb'
require_relative '../spec_helper'

describe 'Score' do
  before(:each) do
    @score = Score.new
  end

  context 'Has expected methods' do
    it 'has inc method' do
      expect(@score).to respond_to(:inc)
    end

    it 'has reset method' do
      expect(@score).to respond_to(:reset)
    end
  end

  context 'Behavior' do
    it 'is zero when initialized' do
      expect(@score.value).to eq 0
    end

    it 'increments' do
      old_val = @score.value
      @score.inc
      expect(@score.value).to be > old_val
    end

    it 'resets' do
      @score.inc
      @score.reset
      expect(@score.value).to eq 0
    end
  end
end
