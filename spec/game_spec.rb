require_relative '../lib/game'

RSpec.describe "Game" do

  before(:each) do
    @game = Game.new
  end

  it "should have scored 5 points after knock down 5 pins" do
    @game.add(5)
    expect(@game.score).to equal(5)
  end

end
