require_relative '../lib/game'

RSpec.describe "Game" do

  before(:each) do
    @game = Game.new
  end

  it "should have scored 9 points after one throw of 5 pins and other of 4 pins" do
    do_throws 5, 4
    game_score_should_be 9
    current_frame_should_be 2
  end

  it "should add points of 4 throws when have no marks" do
    do_throws 5, 4, 3, 6
    game_score_should_be 18
    current_frame_should_be 3
  end

  it "should be able to get score from specific Frame" do
    do_throws 5, 4, 3
    first_frame_should_be 9
    current_frame_should_be 2
  end

  it "should be able to handle spare points" do
    do_throws 3, 7, 3, 2
    first_frame_should_be 13
    game_score_should_be 18
  end

  private

    def do_throws(*throws)
      throws.each { |throw| @game.add(throw) }
    end

    def expect_frame(frame)
      expect(@game.score_for_frame(frame))
    end

    def first_frame_should_be(expected_score)
      expect_frame(1).to equal(expected_score)
    end

    def game_score_should_be(expected_score)
      expect(@game.score).to equal(expected_score)
    end

    def current_frame_should_be(_throw)
      expect(@game.current_frame).to equal(_throw)
    end

end
