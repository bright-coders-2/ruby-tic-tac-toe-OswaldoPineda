
module TicTacToe
    class Board
        attr_reader :grid, :size
        def initialize(size = 5)
        @grid = get_grid(size)
        @size = size
        end

        private

        def get_grid(size)
            Array.new(size) { Array.new(size) { Cell.new } }
            # puts "hola"
        end

    end
end