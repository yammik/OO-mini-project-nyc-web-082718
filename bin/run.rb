require 'pry'

require_relative '../app/models/Allergen.rb'
require_relative '../app/models/Ingredient.rb'
require_relative '../app/models/Recipe.rb'
require_relative '../app/models/RecipeCard.rb'
require_relative '../app/models/RecipeIngredient.rb'
require_relative '../app/models/User.rb'


u1 = User.new('mario')
u2 = User.new('luigi')
u3 = User.new('waluigi')

macncheese = Recipe.new
cookies = Recipe.new
pho = Recipe.new


macncheesecard = u1.add_recipe_card(macncheese, '08312018', 10)

Ingredient.new("cheese")
Ingredient.new("milk")
Ingredient.new("noodles")
Ingredient.new("chocolate chips")
Ingredient.new("sugar")
Ingredient.new("flour")
Ingredient.new("beef flank")
Ingredient.new("beef tendon")

macncheese.add_ingredient(['cheese', 'milk', 'noodles'])
cookies.add_ingredient(['chocolate chips', 'sugar', 'flour', 'eggs'])
pho.add_ingredient(['noodles', 'broth', 'beef flank', 'beef tendon'])

u1.declare_allergen('milk')
u1.declare_allergen('noodles')
u1.declare_allergen('beef flank')
u1.declare_allergen('eggs')
u2.declare_allergen('milk')
u2.declare_allergen('eggs')
u3.declare_allergen('cheese')
u3.declare_allergen('eggs')
binding.pry
