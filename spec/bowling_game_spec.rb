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

  it 'should play one-strike game' do
    game.roll 10
    # skip second roll of first frame
    game.roll 3
    game.roll 4
    16.times { game.roll 0 }
    # first frame: 10 + 0 = 10 strike 10 + 3 + 4 = 17
    # second frame: 17 + 3 + 4 = 24
    expect(game.score).to eq 24
  end

  it 'should handle spare with 10 on second roll' do
    game.roll 0
    game.roll 10
    game.roll 3
    17.times { game.roll 0 }
    expect(game.score).to eq 16
  end

  it 'should play a perfect game' do
    12.times { game.roll 10 }
    expect(game.score).to eq 300
  end

  it 'two strikes in a row' do
    game.roll 10
    game.roll 10
    game.roll 5
    15.times { game.roll 0 }
    # first frame: 10 + (10 + 5) = 25
    # second frame: 25 + 10 + (5 + 0) = 40
    # third frame: 40 + 5 + 0 = 45
    expect(game.score).to eq 45
  end

  it 'should handle a nearly perfect game' do
    11.times { game.roll 10 }
    game.roll 9
    expect(game.score).to eq 299
  end

  it 'should handle 9 strikes and a single spare in the last frame' do
    9.times { game.roll 10 }
    game.roll 9
    game.roll 1
    game.roll 1
    expect(game.score).to eq 270
  end
end
