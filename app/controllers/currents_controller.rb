class CurrentsController < ApplicationController
	# before_action :authenticate_user!


	def index
		@buzzs = Buzz.all.order("created_at DESC").limit(5)
		@hotspot = Hotspot.last
		@meta_description = "Community based fishing networking site with logging tols and a heatmap to share integligence.  Catch intel, local fishing reports, video, product reviews, and hot spots"
	end


	def about
	end

	def rules
	end


	def show
	end

end

private

