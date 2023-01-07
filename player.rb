# frozen_string_literal: true

# this class holds player info
class Player
  attr_reader :name, :symbol, :picks

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @picks = []
  end

  # the pixk array holds all the player picks with this method
  def add_pick(pick)
    picks.push(pick)
  end
end
