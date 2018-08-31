class User
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def my_recipe_cards
    RecipeCard.all.select do |recipeCard|
      recipeCard.user == self
    end
  end

  def recipes
    self.my_recipe_cards.map do |recipe_card_object|
      recipe_card_object.recipe
    end.uniq
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.user == self
    end.map do |allergen_object|
      allergen_object.ingredient
    end.uniq
  end

  def top_three_recipes
    self.my_recipe_cards.sort do |recipe_card1, recipe_card2|
      recipe_card2.rating <=> recipe_card1.rating
    end[0..2]
  end

  def most_recent_recipe
    self.recipes.last
  end
end
