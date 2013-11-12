# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Setting.create([:system_name => 'SuperHimiK', :nav_year => Time.now.year.to_s + ' - ' + (Time.now.year + 1).to_s + ' н.р.', 
	:footer => "by AlexSemch", :about_as => "Про нас", :contact_as => "Звяжіться з нами"])
