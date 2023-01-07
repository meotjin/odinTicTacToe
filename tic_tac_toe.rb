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

def get_input(key, key_check, board)
  begin
    num = Kernel.gets.match(/\d+/)[0]
  rescue StandardError => e
    puts 'invalid input! try again'
    retry
  else
    begin
      board.play(key, num.to_i)
    rescue ScriptError
      puts 'the place you entered is already taken! try again'
      key = get_input(key, key_check, board)
    else
      key = if !board.drawn? && !board.any_winner?(key) && key_check == key then key == 1 ? 2 : 1
            else
              false
            end
      sleep 1
    end
  end
  key
end

puts "\t\t\tWelcome to Tic-Tac-Toe!\n"
board = Board.new(get_player(1), get_player(2))

key = 1
while key
  board.show_board
  current_player = key == 1 ? board.player1 : board.player2
  puts "'#{current_player.name}' please enter a number based on the board(left->right indexing)\n-"
  key = get_input(key, key, board)
end

board.show_board

if board.drawn?
  puts 'game ended in a draw :('
else
  puts 'We have a Winner!'
end
