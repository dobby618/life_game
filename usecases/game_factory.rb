require 'singleton'
require_relative 'block_game'
require_relative 'beacon_game'

class GameFactory
  include Singleton

  def create(name)
    eval "#{name.to_s.capitalize}Game.new"
  end
end
