require_relative '../lib/game'

RSpec.describe "Game" do

  before(:each) do
    @game = Game.new
  end

  it "should have scored 5 points after knock down 5 pins" do
    @game.add(5)
    game_score_should_be 5
  end

  it "should have scored 9 points after one throw of 5 pins and other of 4 pins" do
    do_throws([5, 4])
    game_score_should_be 9
  end

  it "should add points of 4 throws when have no marks" do
    do_throws([5, 4, 9, 6])
    game_score_should_be 24
  end

  it "should be able to get score from specific Frame" do
    do_throws([5, 4])
    expect_frame(1).to equal(9)
  end

  private

    def do_throws(throws)
      throws.each { |throw| @game.add(throw) }
    end

    def expect_frame(frame)
      expect(@game.score_for_frame(frame))
    end

    def game_score_should_be(expected_score)
      expect(@game.score).to equal(expected_score)
    end

end
