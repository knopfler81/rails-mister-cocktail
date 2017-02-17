# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require  'json'


Cocktail.destroy_all

mojito = Cocktail.create!(name: "Mojito")
bloody = Cocktail.create!(name: "Bloody Mary")
brain = Cocktail.create!(name: "Cervelle de Singe")
sunrize = Cocktail.create!(name: "Couché de Soleil")

ingredient_url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
doc = open(ingredient_url).read
json = JSON.parse(doc)

json['drinks'].each do  |ingredient|
  Ingredient.create! name: ingredient["strIngredient1"]
end

descriptions = ["3cl", "10gr", "3 cubes", "5 leaves"]

4.times do
  bloody.doses.create(description: descriptions.sample, ingredient: Ingredient.all.sample) #cocktail_id is already added
  mojito.doses.create(description: descriptions.sample, ingredient: Ingredient.all.sample) #cocktail_id is already added
  brain.doses.create(description: descriptions.sample, ingredient: Ingredient.all.sample)
  sunrize.doses.create(description: descriptions.sample, ingredient: Ingredient.all.sample)
end
