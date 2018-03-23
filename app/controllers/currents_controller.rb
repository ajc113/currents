class CurrentsController < ApplicationController
	# before_action :authenticate_user!


	def index
		@buzzs = Buzz.all.order("created_at DESC").limit(5)
		@hotspot = Hotspot.last
		@meta_description = "Community based fishing networking site with logging tols and a heatmap to share integligence.  Catch intel, local fishing reports, video, product reviews, and hot spots"
		
		set_meta_tags title: "Home",
                  site: "Currents Network",
                  reverse: true,
                  description: "Sportfishing network providing catch reports, action heatmap, fishing spot, and tackle information for offshore big game fishing",
                  keywords: "New england fishing intel, fishing reports, catch reports, big game fishing, offshore fishing"	

	end


	def about
		set_meta_tags title: "About Us",
                  site: "Currents Network",
                  reverse: true,
                  description: "Big game fishing articles covering catch reports, tackle reviews, and locations",
                  keywords: "New england fishing intel, fishing reports, catch reports, big game fishing, offshore fishing"		
	end

	def rules
	end


	def show
	end

	def vhf
		set_meta_tags title: "VHF Stream",
                  site: "Currents Fishing Network",
                  reverse: true,
                  description: "Stream New England VHF radio online to monitor marine chatter",
                  keywords: "New england fishing intel, fishing reports, catch reports, big game fishing, offshore fishing"		
	end


end

private

