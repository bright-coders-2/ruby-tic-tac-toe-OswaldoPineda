require '../spec_helper'

RSpec.describe TicTacToe::Player do
  describe '#initialize' do
    it 'validate reading of name' do
      player = TicTacToe::Player.new({ mark: 'X', name: 'oswaldo' })
      expect(player.name).to eq('oswaldo')
    end

    it 'validate reading of mark' do
      player = TicTacToe::Player.new({ mark: 'O', name: 'omar' })
      expect(player.mark).to eq('O')
    end
  end
end
