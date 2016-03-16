# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	restaurants = Restaurant.create([ {name: 'Oleana', description: 'Mediterranean, International, Spanish, Middle Eastern', address: '134 Hampshire St, Cambridge, MA', phone: '617-661-0505'}, 
									  {name: 'Border Cafe', description: 'Mexican, Southwestern, Cajun & Creole', address: '32 Church St, Cambridge, MA', phone: '617-864-6100'}, 
									  {name: 'Russell House Tavern', description: 'American, Pizza, Pub', address: '14 JFK Street, Cambridge, MA (Brattle Street)', phone: '617-500-3055'}, 
									  {name: "Mr. Bartley's Gourmet Burgers", description: 'American', address: '1246 Massachusetts Ave, Cambridge, MA', phone: '617 354-6559'}, 
									  {name: 'Legal Sea Foods', description: 'American, Seafood', address: '355 Main Street, Cambridge, MA 02142', phone: ' 617-864-3400'}
									  ])
