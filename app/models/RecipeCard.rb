class RecipeCard
  attr_reader :user, :date, :recipe
  attr_accessor :rating

  @@all = []

  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

end
