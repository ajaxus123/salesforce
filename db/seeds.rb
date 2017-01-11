# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Channel.find_or_create_by(name: "Top End")
Channel.find_or_create_by(name: "Independent Pharmacy")
Channel.find_or_create_by(name: "Dischem")
Channel.find_or_create_by(name: "Clicks")
Channel.find_or_create_by(name: "SPWH & TS")
