# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

# clean db
Ingredient.destroy_all
Cocktail.destroy_all

cocktails_url = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'

cocktails = JSON.parse(open(cocktails_url).read)

cocktails['drinks'][0..19].each do |data|  
  cocktail_name = data['strDrink']
  cocktail_indiv_url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{cocktail_name}"
  cocktail_info = JSON.parse(open(cocktail_indiv_url).read)
  cocktail_info['drinks'].each do |data|
    Cocktail.create(name: cocktail_name, image_url: data['strDrinkThumb'])
  end
end

ingredients_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingredients = JSON.parse(open(ingredients_url).read)

ingredients['drinks'].each do |data|
  Ingredient.create(name: data['strIngredient1'])
end