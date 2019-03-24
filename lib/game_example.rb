root = File.expand_path("../", File.dirname(__FILE__))
require "#{root}/lib/TicTacToe.rb"

puts "Welcome to Tic Tac Toe Game :)"
puts "Give me the name of first player: "
player1_name = gets.chomp
player_1 = TicTacToe::Player.new({mark: "X", name: player1_name})
puts "Give me the name of second player: "
player2_name = gets.chomp
player_2 = TicTacToe::Player.new({mark: "O", name: player2_name})
players = [player_1,player_2]

TicTacToe::Game.new(players).play