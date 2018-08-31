class Ingredient
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    result = {}
    Allergen.all.each do |allergen|
      if result.keys.include? allergen.ingredient
        result[allergen.ingredient] += 1
      else
        result[allergen.ingredient] = 1
      end
    end
    result.max_by do |key, value|
      value
    end[0]
  end

end
