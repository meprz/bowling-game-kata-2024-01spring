class BowlingGame
  def initialize
    @rolls = Array.new(21, 0)
    @current_roll = 0
  end

  def roll(pins)
    @rolls[@current_roll] = pins
    @current_roll += 1
    @current_roll += 1 if pins == 10
  end

  def score
    score = 0
    @rolls.each_with_index do |roll, i|
      score += roll
      next if at_beginning_of_frame?(i)

      score += @rolls[i + 1] if spare_frame?(i)
      score += @rolls[i + 2] if strike_frame?(i)
    end
    score
  end

  private

  def at_beginning_of_frame?(i)
    i.even?
  end

  def spare_frame?(i)
    @rolls[i] + @rolls[i - 1] == 10
  end

  def strike_frame?(i)
    @rolls[i - 1] == 10
  end
end
