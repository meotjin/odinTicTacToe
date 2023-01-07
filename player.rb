# frozen_string_literal: true

# this class holds player info
class Player
  attr_reader :name, :symbol, :picks

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @picks = []
  end

  def add_pick(pick)
    picks.push(pick)
  end
end
