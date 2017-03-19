namespace :db do
  namespace :seed do
    desc "Seed only Users"
    task :single, [:arg1] => :environment do |t, args|
      filename = Dir[Rails.root.join('db', 'seeds', "*#{args[:arg1]}*" )]
      if filename.length > 1
        puts "We found the following files:", filename
        puts "Please be more specific which one to seed"
        exit
      else
        puts "Seeding #{filename}"
        load(filename[0])
      end
    end
  end
end
