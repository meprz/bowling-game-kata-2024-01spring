class BowlingGame
  def initialize
    @score = 0
  end

  def roll(pins)
    @score += pins
  end

  attr_reader :score
end
