require_relative './helper'

module TicTacToe
  class Game
    include Helper
    attr_reader :players, :board, :current_player, :other_player, :mapping, :count
    attr_writer :count
    def initialize(players, size)
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
        values
        if @board.decide_winner == 0
          switch_players
          puts @current_player.name.capitalize + ' will play Now...'.green
          @board.print_grid
        else
          @board.print_grid
          puts 'Game over'.yellow
          puts String(@other_player.name) + ' you lost '.red
          puts String(@current_player.name) + ' beat you in ' + String(@count) + ' chances'.green
          play_again
          exit(0)
        end
        @count += 1
      end
      puts 'Game over'.yellow
      puts 'Has been a tie...'.red
      play_again
    end

    def play_again
      play_again = nil
      until play_again == 'y' || play_again == 'n'
        puts 'play again? (y/n)'
        play_again = gets.chomp
      end
      if play_again == 'y'
        switch_players
        @count = 0
        @board.fill_grid
        @board.print_grid
        play
      end
    end

    private

    def values
      log("#{@current_player.name} Your symbol is : #{@current_player.mark}".green)
      begin
        log('enter the position'.capitalize.yellow)
        user_input = 0
        loop do
          user_input = read_board_number
          break if permitted_board_number? user_input
        end
        move = get_coordinates(user_input.to_s)
      rescue ArgumentError
        log('Please enter a Integer value'.red)
        retry
      end
      check_move_disponibility(move)
    end

    def read_board_number
      message = "Enter a valid number between 1 and #{@max_count}".yellow
      log(message)
      num = Integer(gets.chomp)
    end

    def check_move_disponibility(move)
      if @board.check_cell?(move[0], move[1])
        log('position occupied'.red)
        values
      else
        @board.set_cell(move[0], move[1], @current_player.mark)
      end
    end
    
    def permitted_board_number?(num)
      false if num < 1 || num > @max_count
      true
    end

    def fill_mapping
      index = 1
      @board.grid.each_index do |i|
        subarray = @board.grid[i]
        subarray.each_index do |x|
          mapping[index.to_s] = [i, x]
          index += 1
        end
      end
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def get_coordinates(key)
      mapping[key]
    end
  end
end
