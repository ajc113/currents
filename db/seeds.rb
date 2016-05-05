# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Location.where(short_name: "ccb_nw", coordinates: [{lat: 41.83, lng: -70.44}, {lat: 41.87, lng: -70.28},{lat: 41.75, lng: -70.19},{lat: 41.77, lng: -70.49},]).first_or_create
Location.where(short_name: "ccb_se", coordinates: [{lat: 41.984198, lng: -70.319776}, {lat: 41.970926, lng: -70.110349},{lat: 41.803259, lng: -70.222959},{lat: 41.825776, lng: -70.164594}]).first_or_create
Location.where(short_name: "ccb_sw", coordinates: [{lat: 41.887260, lng: -70.529131}, {lat: 41.920867, lng: -70.335363},{lat: 41.783006, lng: -70.498755},{lat: 41.794781, lng: -70.283835}]).first_or_create
Location.where(short_name: "ccb_ne", coordinates: [{lat: 42.092312, lng: -70.4385}, {lat: 42.092312, lng: -70.278577},{lat: 41.940799, lng: -70.342435},{lat: 41.950502, lng: -70.172147}]).first_or_create
Location.where(short_name: "bills", coordinates: [{lat: 41.769980, lng: -70.369901}, {lat: 41.793021, lng: -70.204420},{lat: 41.737196, lng: -70.354108},{lat: 41.754102, lng: -70.178327}]).first_or_create
	# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')