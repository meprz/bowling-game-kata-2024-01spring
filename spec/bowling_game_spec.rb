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

  it 'should play a one-spare game' do
    game.roll 5
    game.roll 5
    game.roll 3
    17.times { game.roll 0 }
    # first frame: 5 + 5 = 10 spare 10 + 3 = 13
    # second frame: 13 + 3 + 0 = 16
    expect(game.score).to eq 16
  end
end
