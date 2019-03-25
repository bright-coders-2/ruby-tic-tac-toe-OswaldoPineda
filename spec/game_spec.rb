require "spec_helper"

RSpec.describe TicTacToe::Game do
    let (:oswaldo) {TicTacToe::Player.new({mark:"X", name:"Oswaldo"})}
    let (:alan) {TicTacToe::Player.new({mark:"O", name:"Alan"})}
    let (:game) {TicTacToe::Game.new([oswaldo,alan])}
    
    describe "#initialize" do
        it "create a players in game" do
            expect(game.current_player).to eq(oswaldo)
            expect(game.other_player).to eq(alan)
        end    
    end
end
