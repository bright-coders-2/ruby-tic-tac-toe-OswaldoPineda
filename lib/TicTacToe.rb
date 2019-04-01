require_relative "./TicTacToe/board"
require_relative "./TicTacToe/game"
#require_relative "./TicTacToe/helper"
require_relative "./TicTacToe/player"
require_relative "./TicTacToe/version"
require "colorize"

module TicTacToe
    play_again = nil
    puts "   Welcome to Tic Tac Toe Game  "
    puts "=== Created by Oswaldo Rivera ==="
    puts "Give me the name of first player: "
    name1 = gets.chomp
    puts "Give me the name of second player: "
    name2 = gets.chomp
    players = [TicTacToe::Player.new({mark: "X".blue, name: name1}),TicTacToe::Player.new({mark: "O".magenta, name: name2})]
    puts "Give me the size of the board game NxN:"
    size = gets.chomp.to_i
    TicTacToe::Game.new(players,size).play
end


