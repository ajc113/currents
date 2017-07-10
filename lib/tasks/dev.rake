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

  task :truncate, [:table_name] => :environment do |t, args|
    table_name = args[:table_name]
    ActiveRecord::Base.connection.execute("TRUNCATE #{table_name} RESTART IDENTITY")
    puts "Table #{table_name} is truncated"
  end

	def create_reports
    primary_methods = ['Live Bait', 'Dead Bait', 'Kite', 'Jigging', 'Popping', 'Trolling']
    tide = ['Incoming', 'Outgoing', 'Slack']
    weather = ['Overcast', 'Rain', 'Sun', 'Fog'] 
    wind = ['W < 10 mph', 'W 10-20 mph', 'W > 20 mph', 'NW < 10 mph', 'NW 10-20 mph', 'NW > 20 mph','N < 10 mph', 'N 10-20 mph', 'N > 20 mph','NE < 10 mph', 'NE 10-20 mph', 'NE > 20 mph','E < 10 mph', 'E 10-20 mph', 'E > 20 mph', 'SE < 10 mph', 'SE 10-20 mph', 'SE > 20 mph','S < 10 mph', 'S 10-20 mph', 'S > 20 mph','SW < 10 mph', 'SW 10-20 mph', 'SW > 20 mph'] 
    Location.all.each do |location|
      (1..5).to_a.sample.times do
        Report.create!(
          state_waters: location.state.id,
          species_id: random("Species"),
          location_id: location.id,
          catch_total: rand(1..150),
          catch_keepers: rand(1..150),
          date: rand(0..7).days.ago,
          user_id: random("User"),
          primary_method: primary_methods.sample, 
          trip_summary: FFaker::Lorem.sentence,
          tide: tide.sample,
          weather: weather.sample,
          wind: wind.sample,
          spot: FFaker::Lorem.word,
          best_bait: FFaker::Lorem.word,
          trip_description: FFaker::Lorem.sentence
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
