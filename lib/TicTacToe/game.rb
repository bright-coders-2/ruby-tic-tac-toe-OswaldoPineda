require_relative "./helper"

module TicTacToe
   class Game
        include Helper
        attr_reader :players, :board, :current_player, :other_player,:mapping
        def initialize (players,size)
            @players = players
            @board = Board.new(size)
            @current_player, @other_player = players[0], players[1]
            @max_count = size * size
            @count = 0
            @mapping = {} 
            fill_mapping
        end

        def fill_mapping
            index = 1
            board.grid.each_index do |i|
                subarray = board.grid[i]
                subarray.each_index do |x|
                    mapping[index.to_s] = [i,x]
                    index = index+1
                end
            end
        end

        def switch_players
            @current_player, @other_player = @other_player, @current_player
        end

        def get_values
            show_message("#{current_player.name} Your symbol is : #{current_player.mark}")
            begin
                show_message("enter the position".capitalize)
                user_input = validate_move
                move = get_coordinates(user_input.to_s)
            rescue ArgumentError
                show_message("Please enter a Integer value")
                retry
            end
            if board.check_cell(move[0],move[1])
                show_message("position occupied")
                validate_move
            end
            board.set_cell(move[0],move[1],current_player.mark)
        end

        def get_coordinates key
            mapping[key]
        end

        def validate_move
            while (num = Integer(gets.chomp))
                next  show_message("enter a valid number between 1 and #{board.size*board.size}") if num < 1 or num > board.size*board.size
                return num
            end
        end

        def play
            while @count < @max_count
                get_values
                if board.decide_winner == 0
                    puts "No match"
                    switch_players
                    puts current_player.name.capitalize + " will play Now..."
                    board.print_grid
                else
                    board.print_grid
                    puts "Game over"
                    puts String(other_player.name)+ " you lost "
                    puts String(current_player.name)+ " beat you in "+ String(@count)+ " chances"
                    exit(0)
                end
                @count+=1
            end
        end
    end 
end