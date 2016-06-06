class MapsController < ApplicationController
	def index
	@reports = Report.all
    @locations = Location.all
	end


	def show
	end
end


