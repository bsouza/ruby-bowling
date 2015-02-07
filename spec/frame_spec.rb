require_relative '../lib/frame'

RSpec.describe "Frame" do

  before(:each) do
    @frame = Frame.new
  end

  it "should have 0 score when there were no throws" do
    score_should_be_equal(0)
  end

  it "should have score after first throw" do
    @frame.add(5)
    score_should_be_equal(5)
  end


private

  def score_should_be_equal(expected_score)
    expect(@frame.score).to equal(expected_score)
  end

end
