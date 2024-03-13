class BowlingGame
  def initialize
    @rolls = Array.new(21, 0)
    @current_roll = 0
  end

  def roll(pins)
    @rolls[@current_roll] = pins
    @current_roll += 1
  end

  def score
    score = 0
    @rolls.each_with_index do |roll, i|
      score += @rolls[i + 1] if at_end_of_frame?(i) && roll + @rolls[i - 1] == 10
      score += roll
    end
    score
  end

  private

  def at_end_of_frame?(i)
    i.odd?
  end
end
