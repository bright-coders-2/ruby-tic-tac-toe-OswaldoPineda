require "player"
require "game"

module TicTacToe
    class Main
        def init
            puts "Welcome to Tic Tac Toe Game :)"
            puts "Give me the name of first player: "
            player1_name = gets.chomp
            player_1 = Player.new({mark: "X", name: player1_name})
            puts "Give me the name of second player: "
            player2_name = gets.chomp
            player_2 = Player.new({mark: "O", name: player2_name})
            players = [player_1,player_2]
            Game.new(players).play
        end 
    end
    run = Main.new.init
end