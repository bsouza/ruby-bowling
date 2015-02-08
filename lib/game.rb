class Game

  attr_accessor :score, :current_frame

  def initialize
    @score = 0
    @throws = []
    @current_throw = 0
    @current_frame = 0
    @is_first_throw = true
  end

  def add(pins)
    @current_throw += 1
    @throws[@current_throw] = pins
    @score += pins

    adjust_current_frame
  end

  def score_for_frame(the_frame)
    ball = 1
    score = 0

    the_frame.times do
      first_throw = @throws[ball]

      ball += 1
      second_throw = @throws[ball]

      frame_score = first_throw + second_throw
      score += frame_score

      if (frame_score == 10)
        score += @throws[ball + 1]
      end
    end

    score
  end

private

  def adjust_current_frame
    if @is_first_throw
      @is_first_throw = false
      @current_frame += 1
    else
      @is_first_throw = true
    end
  end

end
