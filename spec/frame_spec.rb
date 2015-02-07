require_relative '../lib/frame'

RSpec.describe "Frame" do

  before(:each) do
    @frame = Frame.new
  end

  it "should have 0 score when there were no throws" do
    expect(@frame.score).to equal(0)
  end

end
