require '../spec_helper'

RSpec.describe TicTacToe::Board do
  let(:board) { TicTacToe::Board.new(3) }

  describe '#initialize' do
    it 'validate reading of size' do
      expect(board.size).to eq(3)
    end
    it 'validate created grid' do
      positions = [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9']]
      expect(board.grid).to eq(positions)
    end
  end

  describe 'grid' do
    it 'Checking the size of the board row' do
      board.grid.each do |row|
        expect(row.size).to eq(3)
      end
    end
    it 'checking the value of the particular grid' do
      expect(board.get_cell(2, 2)).to eq('9')
    end

    it 'checking that a particular grid is not set  to a wrong value' do
      expect(board.get_cell(0, 1)).not_to eq('8')
    end
  end

  describe '#check_cell?' do
    it 'Check if there is a mark in the cell' do
      board.set_cell(1, 1, 'O')
      expect(board.check_cell?(1, 1)).to eq(true)
    end
  end

  describe '#fill_grid' do
    it 'check if the grid is fill' do
      board.fill_grid
      positions = [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9']]
      expect(board.grid).to eq(positions)
    end
  end

  describe 'mark' do
    it 'checking that user input is accepted correctly' do
      board.set_cell(0, 0, 'X')
      expect(board.get_cell(0, 0)).to eq('X')
    end

    it 'checking that user input is fetched correctly' do
      board.set_cell(0, 1, 'X')
      expect(board.get_cell(0, 1)).not_to eq('O')
    end
  end

  describe '#decide_winner' do
    it 'checking row matching scenario' do
      board.set_cell(0, 0, 'X')
      board.set_cell(0, 1, 'X')
      board.set_cell(0, 2, 'X')
      expect(board.decide_winner).to eq(1)
    end

    it 'checking column matching scenario' do
      board.set_cell(0, 0, 'O')
      board.set_cell(1, 0, 'O')
      board.set_cell(2, 0, 'O')
      expect(board.decide_winner).to eq(1)
    end

    it 'checking diagonal matching scenario' do
      board.set_cell(0, 0, 'O')
      board.set_cell(1, 1, 'O')
      board.set_cell(2, 2, 'O')
      expect(board.decide_winner).to eq(1)
    end
    it 'checking the full game draw scenario' do
      board.set_cell(0, 0, 'O')
      board.set_cell(0, 1, 'X')
      board.set_cell(0, 2, 'O')
      board.set_cell(1, 0, 'O')
      board.set_cell(1, 1, 'X')
      board.set_cell(1, 2, 'O')
      board.set_cell(2, 0, 'X')
      board.set_cell(2, 1, 'O')
      board.set_cell(2, 2, 'X')
      expect(board.decide_winner).to eq(0)
    end
  end
end
