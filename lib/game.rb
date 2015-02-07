class Game

  attr_accessor :score

  def initialize
    @score = 0
  end

  def add(pins)
    @score += pins
  end

end
