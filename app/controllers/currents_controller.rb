class CurrentsController < ApplicationController
	# before_action :authenticate_user!
  layout 'test', only: [:test]
  def test
    render file: 'layouts/test'
  end

	def index
		@buzzs = Buzz.all.order("created_at DESC").limit(5)
		@hotspot = Hotspot.last		
		set_meta_tags title: "Home",
                  site: "Currents Fishing Network",
                  reverse: true,
                  description: "Sportfishing network providing catch reports, activity heatmap, fishing spots, and tackle information for offshore big game fishing",
                  keywords: "New england fishing intel, fishing reports, catch reports, big game fishing, offshore fishing"	
        @posts = Post.all.order("created_at DESC").limit(5)
        @intels = Intel.all.order("created_at DESC").limit(3)
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
                  description: "Stream New England VHF marine radio online to monitor marine and fishing chatter",
                  keywords: "New england fishing intel, fishing reports, catch reports, big game fishing, offshore fishing"		
	end

end

private

