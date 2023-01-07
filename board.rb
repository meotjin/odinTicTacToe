# frozen_string_literal: true

# Class that holds boards info and methods
class Board
  @@win_scenarios = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board_inputs = Array.new(9, ' ')
  end

  # need to show players a ui of their game
  def show_board
    key = 0
    5.times do |turn|
      index = [0 + key, 1 + key, 2 + key]
      if turn.even?
        puts " #{@board_inputs[index[0]]} | #{@board_inputs[index[1]]} | #{@board_inputs[index[2]]} "
        key += 3
      else
        puts '---|---|---'
      end
    end
  end

  # player plays a move and it will be stored in both board and its object
  def play(key, pick)
    current_player = key == 1 ? player1 : player2
    @board_inputs[pick] = current_player.symbol
    current_player.add_pick(pick)
  end

  # checks if a given play has a winning combination in its picks array based on the win_scenarios array.
  def any_winner?(key)
    current_player = key == 1 ? player1 : player2
    win_scenarios.one? { |array| array.subset?(current_player.picks) }
  end

  def drawn?
    @board_inputs.include?('')
  end
end
