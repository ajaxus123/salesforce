require "test_helper"

describe Region do
  let(:region) { Region.new }

  it "must be valid" do
    value(region).must_be :valid?
  end
end
