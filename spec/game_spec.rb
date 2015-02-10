require_relative '../lib/game'

RSpec.describe "Game" do

  before(:each) do
    @game = Game.new
  end

  it "should have scored 9 points after one throw of 5 pins and other of 4 pins" do
    do_throws 5, 4
    game_score_should_be 9
  end

  it "should add points of 4 throws when have no marks" do
    do_throws 5, 4, 3, 6
    game_score_should_be 18
  end

  it "should be able to get score from specific Frame" do
    do_throws 5, 4, 3
    first_frame_should_be 9
  end

  it "should add points from next throw in spare frame" do
    do_throws 3, 7, 3, 2, 4
    first_frame_should_be 13
    second_frame_should_be 18
    game_score_should_be 18
  end

  it "should add points from next two throws in strike frame" do
    do_throws 10, 3, 6
    first_frame_should_be 19
    game_score_should_be 28
  end

  it "should reach 300 points in a perfect game" do
    12.times { @game.add 10 }
    game_score_should_be 300
  end

  it "should be able to handle a spare in last throw" do
    9.times do
      do_throws 0, 0
    end

    do_throws 2, 8, 10
    game_score_should_be 20
  end

  it "test sample game" do
    do_throws 1, 4,
              4, 5,
              6, 4,
              5, 5,
              10,
              0, 1,
              7, 3,
              6, 4,
              10,
              2, 8,
              6

    game_score_should_be 133
  end

  it "test heart break" do
    11.times { @game.add 10 }
    @game.add 9
    game_score_should_be 299
  end

  it "test tenth frame spare" do
    9.times { @game.add 10 }
    [ 9, 1, 1 ].each { |pins| @game.add pins }
    game_score_should_be 270
  end

private

  def do_throws(*throws)
    throws.each { |pins| @game.add(pins) }
  end

  def expect_frame(frame)
    expect(@game.score_for_frame(frame))
  end

  def first_frame_should_be(expected_score)
    expect_frame(1).to equal(expected_score)
  end

  def second_frame_should_be(expected_score)
    expect_frame(2).to equal(expected_score)
  end

  def game_score_should_be(expected_score)
    expect(@game.score).to equal(expected_score)
  end

end
