require '../spec_helper'

RSpec.describe TicTacToe::Game do
  let(:oswaldo) { TicTacToe::Player.new({ mark: 'X', name: 'Oswaldo' }) }
  let(:alan) { TicTacToe::Player.new({ mark: 'O', name: 'Alan' }) }
  let(:game) { TicTacToe::Game.new([oswaldo, alan], 3) }

  describe '#initialize' do
    it 'create a players in game' do
      expect(game.current_player).to eq(oswaldo)
      expect(game.other_player).to eq(alan)
    end
  end

  describe '#play' do
    it 'should not have a winner' do
      expect(game.board.decide_winner).to eq(0)
    end

    it 'should have a winner' do
      game.board.set_cell(0, 0, 'X')
      game.board.set_cell(1, 0, 'O')
      game.board.set_cell(0, 1, 'X')
      game.board.set_cell(1, 1, 'O')
      game.board.set_cell(0, 2, 'X')
      expect(game.board.decide_winner).to eq(1)
    end
  end
end
