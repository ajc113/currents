# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Location.where(short_name: "ccb_nw", coordinates: [{lng: 41.83, lat: -70.44}, {lng: 41.87, lat: -70.28},{lng: 41.75, lat: -70.19},{lng: 41.77, lat: -70.49},]).first_or_create
Location.where(short_name: "ccb_se", coordinates: [{lng: 41.984198, lat: -70.319776}, {lng: 41.970926, lat: -70.110349},{lng: 41.803259, lat: -70.222959},{lng: 41.825776, lat: -70.164594}]).first_or_create
Location.where(short_name: "ccb_sw", coordinates: [{lng: 41.887260, lat: -70.529131}, {lng: 41.920867, lat: -70.335363},{lng: 41.783006, lat: -70.498755},{lng: 41.794781, lat: -70.283835}]).first_or_create
Location.where(short_name: "ccb_ne", coordinates: [{lng: 42.092312, lat: -70.4385}, {lng: 42.092312, lat: -70.278577},{lng: 41.940799, lat: -70.342435},{lng: 41.950502, lat: -70.172147}]).first_or_create
Location.where(short_name: "bills", coordinates: [{lng: 41.769980, lat: -70.369901}, {lng: 41.793021, lat: -70.204420},{lng: 41.737196, lat: -70.354108},{lng: 41.754102, lat: -70.178327}]).first_or_create
	# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')