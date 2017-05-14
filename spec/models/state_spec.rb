require 'rails_helper'

RSpec.describe State, type: :model do
  it { should have_many(:locations).with_primary_key(:name).with_foreign_key(:state_waters) }
  it { should have_many(:reports).with_primary_key(:name).with_foreign_key(:state_waters) }
  it { should have_many(:users).with_primary_key(:name).with_foreign_key(:state_waters) }
end
