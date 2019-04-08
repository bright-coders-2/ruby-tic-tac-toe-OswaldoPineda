
module TicTacToe
  class Player
    attr_reader :mark, :name
    def initialize(input)
      @mark = input.fetch(:mark)
      @name = input.fetch(:name)
    end
  end
end
