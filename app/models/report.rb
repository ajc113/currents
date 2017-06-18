class Report < ActiveRecord::Base
  include Filterable

  validates :date, :species_id, :state_waters, :location_id, :catch_keepers, presence: true
  validate :validate_date

  belongs_to :location
  belongs_to :user
  belongs_to :species
  belongs_to :state, foreign_key: :state_waters

  by_star_field :date

  default_scope {order('date DESC')}

  scope :species, -> (species) { where(species_id: species)}

  scope :state, -> (state) { where(state: state) }

  scope :location, -> (location) { where(location: location )}

  scope :tide, -> (tide) {where(tide: tide)}

  scope :date, -> (month) {where("extract(month from date) = ?", month)}



  def location_json
    File.read self.location.coordinate_file.path
  end

  private

  def validate_date
    if !self[:date].blank? and self[:date] > Date.today
      errors.add(:date, 'must not be set in the future')
    end
  end

end
