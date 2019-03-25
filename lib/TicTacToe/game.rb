

module TicTacToe
   class Game
        attr_reader :players, :board, :current_player, :other_player
        def initialize (players, board = Board.new)
            @players = players
            @board = board
            @current_player, @other_player = players[0], players[1]
        end
    end 
end