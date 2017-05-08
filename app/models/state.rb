class State < ActiveRecord::Base
  has_many :locations, primary_key: :name, foreign_key: :state
  has_many :users, primary_key: :name, foreign_key: :state
  has_many :reports, primary_key: :name, foreign_key: :state
end
