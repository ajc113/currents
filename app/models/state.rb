class State < ActiveRecord::Base
  self.primary_key = :name
  has_many :locations, primary_key: :name, foreign_key: :state_waters
  has_many :users, primary_key: :name, foreign_key: :state_waters
  has_many :reports, primary_key: :name, foreign_key: :state_waters
end