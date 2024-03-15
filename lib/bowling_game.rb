class BowlingGame
  def initialize
    @rolls = Array.new(21, 0)
    @current_roll = 0
  end

  def roll(pins)
    @rolls[@current_roll] = pins
    @current_roll += 1 if pins == 10 && at_beginning_of_frame?(@current_roll) && not_on_tenth_frame?(@current_roll)
    @current_roll += 1
  end

  def score
    score = 0
    @rolls.each_with_index do |roll, i|
      score += roll
      next if at_beginning_of_frame?(i)

      score += @rolls[i + 1] if spare_frame?(i)
      next unless strike_frame?(i)

      if strike_frame?(i + 2)
        score += @rolls[i + 3] if not_on_tenth_frame?(i)
      else
        score += @rolls[i + 2]
      end
      # puts score
    end
    score
  end

  private

  def at_beginning_of_frame?(i)
    i.even?
  end

  def spare_frame?(i)
    @rolls[i] + @rolls[i - 1] == 10 && not_on_tenth_frame?(i)
  end

  def strike_frame?(i)
    @rolls[i - 1] == 10
  end

  def not_on_tenth_frame?(i)
    i < 18
  end
end
