class Location < ActiveRecord::Base


	mount_uploader :coordinate_file, LocationJsonUploader
	validates :coordinate_file, presence: true
	validates :state_waters, presence: true

	has_many :reports
	has_many :users, through: :reports
	belongs_to :state, primary_key: :name, foreign_key: :state_waters

  #display_name is defined for activeadmin
	def display_name
		self.short_name
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
	end

end
