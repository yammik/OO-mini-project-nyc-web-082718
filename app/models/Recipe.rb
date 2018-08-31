class Recipe

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    result = {}
    RecipeCard.all.each do |recipe_card|
      if result.keys.include? recipe_card.recipe
        result[recipe_card.recipe] += 1
      else
        result[recipe_card.recipe] = 1
      end
    end
    result.max_by do |key, value|
      value
    end[0]
  end

  def my_recipe_cards
    RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end
  end

  def users
    my_recipe_cards.map do |recipe_card_obj|
      recipe_card_obj.user
    end.uniq
  end

  def ingredients
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end.map do |recipe_card_object|
      recipe_card_object.ingredient
    end.uniq
  end

  def allergens
    allergens_array = []
    self.users.each do |user|
      user.allergens.each do |ingredient|
        allergens_array << ingredient
      end
    end
    allergens_array.uniq
  end

  def add_ingredient(ing_array)
    ing_array.each do |ing_name|
      # if !(Ingredient.all.map do |ing|
      #     ing.name
      #   end.include? ing_name)
      #   Ingredient.new(ing_name)
      # end
      # Ingredient.all.each do |ing|
      #   if ing.name == ing_name
      #     RecipeIngredient.new(self, ing)
      #   end
      # end
      #
      # ing_obj = Ingredient.all.select do |ing|
      #     ing.name == ing_name
      # end
      # RecipeIngredient.new(self, ing_obj)

      ing_exists = Ingredient.all.find do |ingredient|
        ingredient.name == ing_name
      end

      if ing_exists
        RecipeIngredient.new(self, ing_exists)
      else
        new_ing = Ingredient.new(ing_name)
        RecipeIngredient.new(self, new_ing)
      end
    end
  end

end
