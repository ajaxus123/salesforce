require "test_helper"

describe StoreVisit do
  let(:store_visit) { StoreVisit.new }

  it "must be valid" do
    value(store_visit).must_be :valid?
  end
end
