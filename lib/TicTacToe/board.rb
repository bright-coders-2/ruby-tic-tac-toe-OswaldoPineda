require_relative './helper'
require 'matrix'

module TicTacToe
  class Board
    include Helper
    attr_reader :grid, :size
    def initialize(size)
      @size = size
      @grid = Array.new(@size) { Array.new(@size) }
      fill_grid
      print_grid 
    end

    def fill_grid
      log('Loading grid...'.red)
      index = 1
      @grid.each_index do |i|
        sub_array = @grid[i]
        sub_array.each_index do |x|
          @grid[i][x] = index.to_s
          index += 1
        end
      end
    end

    def print_grid
      puts '          ' + '----------------------------------------------'
      @grid.each do |row|
        puts '          ' + row.map { |cell| cell.nil? ? '_' : '| ' + cell + ' |' }.join('  ')
        puts '          ' + '----------------------------------------------'
      end
    end

    def check_cell?(pos_x, pos_y) 
      return true if @grid[pos_x][pos_y].include?"X" or @grid[pos_x][pos_y].include?"O"
      return false
    end

    def get_cell pos_x, pos_y 
      @grid[pos_x][pos_y]
    end

    def set_cell(pos_x, pos_y, value)
      if @grid[pos_x][pos_y].include?"X" or @grid[pos_x][pos_y].include?"O"
        log('Already taken'.red)
      else
        @grid[pos_x][pos_y] = value
      end 
    end

    def decide_winner
      diagonal1 = Matrix.rows(@grid).each(:diagonal).to_a
      diagonal2 = Matrix.rows(@grid.reverse).each(:diagonal).to_a
      if @grid.any? { |row| row.uniq.count == 1 }
        return 1
      elsif @grid.transpose.any? { |row| row.uniq.count == 1 }
        return 1
      elsif diagonal1.uniq.size == 1
        return 1
      elsif diagonal2.uniq.size == 1
        return 1
      else
        return 0
      end
    end
  end
end