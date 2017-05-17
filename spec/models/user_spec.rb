require 'rails_helper'

RSpec.describe User, type: :model  do

  it { should have_many :reports }
  it { should have_many :buzzs }
  it { should have_many(:locations).through(:reports) }
  it { should validate_presence_of :state_waters }

end
