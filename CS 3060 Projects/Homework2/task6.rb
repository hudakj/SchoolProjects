# Define the abstract Shape class
class Shape
  attr_accessor :color

  def initialize(color)
    @color = color
  end

  # Define the abstract area method
  def area
    raise NotImplementedError, "Subclasses must implement the area method"
  end
end

# Define the Octagon class
class Octagon < Shape
  def initialize(color, side_length)
    super(color)
    @side_length = side_length
  end

  def area
    2 * (1 + Math.sqrt(2)) * @side_length**2
  end
end

# Define the Hexagon class
class Hexagon < Shape
  def initialize(color, side_length)
    super(color)
    @side_length = side_length
  end

  def area
    3 * Math.sqrt(3) * @side_length**2 / 2
  end
end

# Now, in your main program, you can generate random Octagons and Hexagons
shape_list = []

50.times do
  color = ["red", "blue", "green"].sample
  side_length = rand(1..10) # Assuming a range for side length
  if rand(2) == 0
    shape_list << Octagon.new(color, side_length)
  else
    shape_list << Hexagon.new(color, side_length)
  end
end

# Calculate total area using polymorphism
total_area = shape_list.sum(&:area)
puts "Total area of all shapes: #{total_area}"