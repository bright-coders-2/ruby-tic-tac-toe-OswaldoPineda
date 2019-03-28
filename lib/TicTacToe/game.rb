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

        def play 
            while @count < @max_count
                get_values
                if board.decide_winner == 0
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

        protected

        def get_values
            log("#{current_player.name} Your symbol is : #{current_player.mark}")
            begin
                log("enter the position".capitalize)
                user_input = 0
                loop do
                    user_input = read_board_number
                    break if permitted_board_number? user_input
                end
                move = get_coordinates(user_input.to_s)
            rescue ArgumentError
                log("Please enter a Integer value")
                retry
            end
            check_move_disponibility(move)
        end

        private 

        def read_board_number
            message = "Enter a valid number between 1 and #{@max_count}"
            log(message)
            num = Integer(gets.chomp)
        end

        def check_move_disponibility move
            if @board.check_cell?(move[0],move[1])
                logx("position occupied")
                get_values
            else
                @board.set_cell(move[0],move[1],current_player.mark)
            end
        end
      
        def permitted_board_number?(num)
            return false if num < 1 or num > @max_count
            return true
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


        def get_coordinates key
            mapping[key]
        end

    end 
end