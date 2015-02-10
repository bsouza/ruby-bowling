class Scorer

  def initialize
    @throws = []
    @current_throw = 0
  end

  def add_throw(pins)
    @current_throw += 1
    @throws[@current_throw] = pins
  end

  def score_for_frame(the_frame)
    @ball = 1
    score = 0

    the_frame.times do
      if strike?
        score += 10 + next_two_balls_for_strike
        @ball += 1
      elsif spare?
        score += 10 + next_ball_for_spare
        @ball += 2
      else
        score += next_two_balls
        @ball += 2
      end
    end

    score
  end

private

  def next_two_balls_for_strike
    @throws[@ball + 1] + @throws[@ball + 2]
  end

  def next_ball_for_spare
    @throws[@ball + 2]
  end

  def next_two_balls
    @throws[@ball] + @throws[@ball + 1]
  end

  def spare?
    10.equal? next_two_balls
  end

  def strike?
    @throws[@ball].equal? 10
  end

end
