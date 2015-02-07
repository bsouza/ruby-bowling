class Game

  attr_accessor :score

  def initialize
    @score = 0
    @throws = []
    @current_throw = 0
  end

  def add(pins)
    @current_throw += 1
    @throws[@current_throw] = pins
    @score += pins
  end

  def score_for_frame(the_frame)
    ball = 1
    score = 0

    the_frame.times do
      first_throw = @throws[ball]

      ball += 1
      second_throw = @throws[ball]

      score += first_throw + second_throw
    end

    score
  end

end
