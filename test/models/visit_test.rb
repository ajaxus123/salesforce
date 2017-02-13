require "test_helper"

describe Visit do
  let(:visit) { Visit.new }

  it "must be valid" do
    value(visit).must_be :valid?
  end
end
