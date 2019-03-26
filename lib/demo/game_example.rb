require_relative "../TicTacToe.rb"

puts "   Welcome to Tic Tac Toe Game  "
puts "=== Created by Oswaldo Rivera ==="
puts "Give me the name of first player: "
name1 = gets.chomp
puts "Give me the name of second player: "
name2 = gets.chomp
players = [TicTacToe::Player.new({mark: "X", name: name1}),TicTacToe::Player.new({mark: "O", name: name2})]
puts "Give me the size of the board game NxN:"
size = gets.chomp.to_i
TicTacToe::Game.new(players,size).play