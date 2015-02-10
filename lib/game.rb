require_relative 'scorer'

class Game

  def initialize
    @current_frame = 0
    @is_first_throw = true
    @scorer = Scorer.new
  end

  def add(pins)
    @scorer.add_throw(pins)
    adjust_current_frame pins
  end

  def score
    @scorer.score_for_frame(@current_frame)
  end

  def score_for_frame(the_frame)
    @scorer.score_for_frame(the_frame)
  end

private

  def advance_frame
    @current_frame += 1
    @current_frame = 10 if @current_frame > 10
    @is_first_throw = true
  end

  def advance_frame_for_strike(pins)
    is_strike = pins.equal? 10
    advance_frame if is_strike
    is_strike ? true : false
  end

  def strike?(pins)
    @is_first_throw && 10.equal?(pins)
  end

  def adjust_current_frame(pins)
    if last_ball_in_frame?(pins)
      advance_frame
    else
      @is_first_throw = false
    end
  end

  def last_ball_in_frame?(pins)
    strike?(pins) || (!@is_first_throw)
  end

end
