class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable, :confirmable

	has_many :reports
	has_many :buzzs   
	has_many :locations, through: :reports
  belongs_to :state, primary_key: :name, foreign_key: :state
	def display_name
		self.email
	end

	STATES = [
		# "AL",
		# "AK",
		# "AZ",
		# "AR",
		# "CA",
		# "CO",
		"CT",
		# "DE",
		# "DC",
		# "FL",
		# "GA",
		# "HI",
		# "ID",
		# "IL",
		# "IN",
		# "IA",
		# "KS",
		# "KY",
		# "LA",
		"ME",
		# "MD",
		"MA",
		# "MI",
		# "MN",
		# "MS",
		# "MO",
		# "MT",
		# "NE",
		# "NV",
		"NH",
		# "NJ",
		# "NM",
		"NY",
		# "NC",
		# "ND",
		# "OH",
		# "OK",
		# "OR",
		# "PA",
		# "PR",
		"RI",
		# "SC",
		# "SD",
		# "TN",
		# "TX",
		# "UT",
		# "VT",
		# "VA",
		# "WA",
		# "WV",
		# "WI",
		# "WY",
		"Offshore - Gulf of Maine",
		"Offshore - South of New England",
		"Offshore - East of Chatham and Georges Bank",
		"Offshore - Northeast Canyons"
	]

end
