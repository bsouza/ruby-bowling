class Game

  attr_accessor :current_frame

  def initialize
    @score = 0
    @throws = []
    @current_throw = 0
    @current_frame = 1
    @is_first_throw = true
  end

  def add(pins)
    @current_throw += 1
    @throws[@current_throw] = pins
    @score += pins

    adjust_current_frame pins
  end

  def score_for_frame(the_frame)
    ball = 0
    score = 0

    the_frame.times do
      ball += 1
      first_throw = @throws[ball]

      if first_throw.equal? 10
        score += 10 + @throws[ball + 1] + @throws[ball + 2]
      else
        ball += 1
        second_throw = @throws[ball]

        frame_score = first_throw + second_throw
        score += frame_score

        if (frame_score == 10)
          score += @throws[ball + 1]
        end
      end
    end

    score
  end

  def score
    score_for_frame(@current_frame - 1)
  end

private

  def adjust_current_frame(pins)
    if @is_first_throw
      if pins.equal? 10
        @current_frame += 1
      else
        @is_first_throw = false
      end
    else
      @is_first_throw = true
      @current_frame += 1
    end

    @current_frame = 11 if @current_frame > 11
  end

end
