class Report < ActiveRecord::Base

  include Filterable

  validate :validate_date

  belongs_to :location
  belongs_to :user
  has_one :specie

  default_scope {order('date DESC')}

  scope :species, -> (species) { where(specie_id: species)}

  scope :location, -> (location) { where(location: location )}

  scope :tide, -> (tide) {where(tide: tide)}

  scope :date, -> (month) {where("extract(month from date) = ?", month)}



  def location_json
    f = File.read self.location.coordinate_file.path
    # puts "f is #{f.inspect}".green
    # # f = f[0]
    # puts "f[0] is #{f}".blue
    # location_json = JSON.parse(f)
    # puts "location_json is #{location_json}".green
    # return location_json
    f
  end

  private

  def validate_date
    unless  self[:date] <  Date.today
      errors.add(:date, 'must not be set in the future')
    end
  end

end
