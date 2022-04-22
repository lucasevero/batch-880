class Cat
  # OPP - state + behavior

  # State => information => instance varibles

  def initialize(name, color)
    # initialize is called when "Cat.new"

    @name = name
    @color = color
  end

  # Behavior => changing states => methods

  def dye(new_color)
    @color = new_color
  end

  def self.meow
    "Meooooooow"
  end
end

garfield = Cat.new("garfield", "orange")
p garfield

garfield.dye("green")
p garfield

p Cat.meow
