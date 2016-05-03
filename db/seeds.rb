# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Location.where(short_name: "Spot A", coordinates: [{lng: 42342, lat: 42342}, {lng: 43223, lat: 52423}]).first_or_create
Location.where(short_name: "Spot B", coordinates: [{lng: 42342, lat: 42342}, {lng: 43223, lat: 52423}]).first_or_create
Location.where(short_name: "Spot C", coordinates: [{lng: 42342, lat: 42342}, {lng: 43223, lat: 52423}]).first_or_create