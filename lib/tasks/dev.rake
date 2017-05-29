namespace :dev do
	desc 'Creates sample data for local development'
	task :prime => :environment do
		unless Rails.env.development?
			raise 'This task can only be run in the development environment'
		end

		require 'factory_girl_rails'
		include FactoryGirl::Syntax::Methods
		create_reports
	end

	def create_reports
    primary_methods = ['Live Bait', 'Dead Bait', 'Kite', 'Jigging', 'Popping', 'Trolling']
    Location.all.each do |location|
      (1..5).to_a.sample.times do
        Report.create!(
          state_waters: location.state.id,
          species_id: random("Species"),
          location_id: location.id,
          catch_total: rand(1..150),
          catch_keepers: rand(1..150),
          date: rand(1..10).days.ago,
          user_id: random("User"),
          primary_method: primary_methods.sample, 
          trip_summary: FFaker::Lorem.sentence,
        ) 
      end
    end
    header("#{Report.count} reports created")
  end

  def random(model, column='id')
    model = model.constantize
    model.order("RANDOM()").first.public_send(column)
  end
  
  def header(msg)
    puts "\n\n*** #{msg.upcase} *** \n\n"
  end
end
