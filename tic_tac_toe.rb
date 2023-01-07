# frozen_string_literal: true

# handles running the game and ui

require_relative 'board'
require_relative 'player'

def get_player(key)
  symbols = ['$', 'X', 'O', '@']
  puts "\nplayer#{key} please inter your name\n>>"
  player_name = gets.chomp
  puts "\t'#{player_name}' entered the game! your symbol is #{symbols[key]}"
  sleep 1
  Player.new(player_name, symbols[key])
end

puts "\t\t\tWelcome to Tic-Tac-Toe!\n"
board = Board.new(get_player(1), get_player(2))
