class Cat
  # State + Behavior
  attr_reader :color

  def initialize(name, color)
    # ran when you call 'Cat.new'

    @name = name
    @color = color
  end

  def dye(new_color)
    @color = new_color
  end

  def self.meow
    return 'meooooow'
  end
end

garfield = Cat.new('garfield', 'orange')
p garfield

garfield.dye('blue')
p garfield

p Cat.meow

# Class methods
# Time.now, Date.today, File.open, ...
