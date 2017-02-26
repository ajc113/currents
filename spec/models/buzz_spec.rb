RSpec.describe Buzz do

  describe "validations" do
    it { is_expected.to validate_presence_of(:post) }
    it { is_expected.to validate_length_of(:post).is_at_most(180).on(:create) }
  end

  it "does not allow length to be more than 180" do
  end
end
