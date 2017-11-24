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

  scope :past_one_week, -> {where("date >= ?", Date.today-6)}

  scope :past_eight_days, -> {where("date between ? AND ?", Date.today-7, Date.today-1)}

  scope :one_week_prior_three_days, -> {where("date between ? AND ?", Date.today - 9, Date.today - 3)}

  def location_json
    File.read self.location.coordinate_file.path
  end

  after_create :send_notification if Rails.env.production?

  def send_notification
    AdminMailer.delay.new_report(self)
  end

  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |product|
      csv << product.attributes.values_at(*column_names)
    end
  end
end

  private

  def validate_date
    if !self[:date].blank? and self[:date] > Date.today
      errors.add(:date, 'must not be set in the future')
    end
  end
end
