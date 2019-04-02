require_relative "./helper"
require 'matrix'

module TicTacToe
    class Board
        include Helper
        attr_reader :grid, :size
        
        def initialize(size)
            @size = size
            @grid = Array.new(size) { Array.new(size) }
            fill_grid
            print_grid 
        end

        def fill_grid
            log("Loading grid...")
            index = 1
            grid.each_index do |i|
                sub_array = grid[i]
                sub_array.each_index do |x|
                    grid[i][x] = index.to_s
                    index = index+1
                end
            end
        end

        def print_grid
            puts "          " +"----------------------------------------------"
            grid.each do |row|
                #puts row.map { |cell| !cell.nil? ? "|"+cell+"|" : "|"+"  |"  }.join("")
                puts "          " + row.map { |cell| cell.nil? ? "_" : "| "+cell+" |" }.join("  ")
                puts "          " +"----------------------------------------------"
            end
        end

        def check_cell?(x,y) 
            return true if grid[x][y].include?"X" or grid[x][y].include?"O"
            return false
        end

        def get_cell x,y 
            grid[x][y]
        end

        def set_cell(x,y,value)
            if grid[x][y].include?"X" or grid[x][y].include?"O"
                log("Already taken")
            else
                grid[x][y] = value
            end 
        end

        def decide_winner
            diagonal_1 = Matrix.rows(grid).each(:diagonal).to_a
            diagonal_2 = Matrix.rows(grid.reverse).each(:diagonal).to_a
            if grid.any? { |row| row.uniq.count == 1 }
              return 1
            elsif grid.transpose.any? { |row| row.uniq.count == 1 }
              return 1
            elsif diagonal_1.uniq.size == 1
              return 1
            elsif diagonal_2.uniq.size == 1
              return 1
            else
              return 0
            end
        end
    end
end