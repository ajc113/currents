class HotspotsController < ApplicationController
	
def new
	@hotspot = Hotspot.new
end

def create 
	@hostspot = Hotspot.new(hotspot_params)
	
	if @hotspot.save
	 redirect_to @hotspot
	else
	render 'new'
	end 
end


private
def hotspot_params
	params.require(:hotspot).permit(:name, :commentary, :image)
end



end
