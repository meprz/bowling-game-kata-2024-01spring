require 'bowling_game'

RSpec.describe BowlingGame do
  let(:game) { BowlingGame.new }

  it 'should play a gutter game' do
    20.times { game.roll 0 }
    expect(game.score).to eq 0
  end

  it 'should play a all-ones game' do
    20.times { game.roll 1 }
    expect(game.score).to eq 20
  end
end
