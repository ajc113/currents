class Location < ActiveRecord::Base


  mount_uploader :coordinate_file, LocationJsonUploader

  has_many :reports
  has_many :users, through: :reports
  belongs_to :state, primary_key: :name, foreign_key: :state
  # has_many :specie
  def display_name
    self.short_name
  end
  before_save :log_coordinates
  serialize :coordinates

  attr_accessor :lat1, :lng1
  attr_accessor :lat2, :lng2
  attr_accessor :lat3, :lng3
  attr_accessor :lat4, :lng4
  attr_accessor :lat5, :lng5



  scope :short_name, lambda { |location|
    where(short_name: [*location])
  }

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end

  def log_coordinates
    a = []

    a.push ({lat: self.lat1.to_f, lng: self.lng1.to_f}) unless self.lat1.blank? || self.lng1.blank?
    a.push ({lat: self.lat2.to_f, lng: self.lng2.to_f}) unless self.lat2.blank? || self.lng2.blank?
    a.push ({lat: self.lat3.to_f, lng: self.lng3.to_f}) unless self.lat3.blank? || self.lng3.blank?
    a.push ({lat: self.lat4.to_f, lng: self.lng4.to_f}) unless self.lat4.blank? || self.lng4.blank?
    self.coordinates = a
  end


  def raw(stringish)
    stringish.to_s.html_safe
  end


  def catch_total
    @reports = self.reports
    @catches = @reports.collect{|report| report.catch_total}
    @catches.sum
  end

  def color
    case
    when catch_total >= 0 && catch_total < 10
      '#4562A8'
    when catch_total >= 10 && catch_total < 20
      '#E8C85A'
    when catch_total >= 20
      '#FF3E38'
    end
    # case
  end


end
