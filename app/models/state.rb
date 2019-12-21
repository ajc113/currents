class State < ApplicationRecord
  self.primary_key = :name
  has_many :locations, primary_key: :name, foreign_key: :state_waters
  has_many :users, primary_key: :name, foreign_key: :state_waters
  has_many :reports, primary_key: :name, foreign_key: :state_waters
  scope :sorted, -> { order(visible: :desc, name: :asc) }
  scope :visible, -> { where(visible: true) } 
end
