class Report < ActiveRecord::Base

  validate :validate_date

  belongs_to :location
  belongs_to :user
  has_many :specie

  # default_scope {order('date DESC')}

  scope :selected_species, -> (the_species) { where(target_species: the_species)}

  scope :selected_location, -> (the_location) { where(location: the_location )}

  scope :selected_tide, -> (the_tide) {where(tide: the_tide)}

  scope :selected_date, -> (month) {where("cast(strftime('%m', date) as int) = ?", month)}



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
