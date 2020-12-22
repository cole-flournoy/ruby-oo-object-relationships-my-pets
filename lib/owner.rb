class Owner
  attr_accessor
  attr_reader :name, :species

  @@all = []

  def self.all
    @@all
  end
  
  def self.count
    self.all.count
  end

  def self.reset_all
    @@all = []
  end
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.collect {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.collect {|cat| cat.mood = "happy"}
  end

  def sell_pets
    my_pets = self.cats + self.dogs
    my_pets.collect do |pet| 
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end