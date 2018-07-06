require 'rails_helper'

RSpec.describe User, type: :model  do

  it { should have_many :reports }
  it { should have_many :buzzs }
  it { should have_many(:locations).through(:reports) }
  it { should validate_presence_of :state_waters }

  it "returns the trial days" do
    user = create(:user, created_at: Date.today - 5)
    expect(user.calculate_trial_days).to eq 25
  end

  it "returns nil if the trial is over" do
    user = build_stubbed(:user, created_at: Date.today - 40)
    expect(user.calculate_trial_days).to eq nil
  end

  it "returns if user is trialing or not" do
    user = create(:user, created_at: Date.today - 5)
    expect(user.trialing?).to be true
    user = build_stubbed(:user, created_at: Date.today - 40)
    expect(user.trialing?).to be false
  end

end
