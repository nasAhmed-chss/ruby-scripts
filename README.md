# ruby-scripts
Problem 1: Array Class Enhancements
This script extends the Ruby Array class to return a default value for out-of-bound indices and modifies the map method to accept a sequence of indices.

Usage:
require './array'
# Example usage:
a = [1,2,34,5]
puts a[10] # '\0'
puts a.map(2..4) { |i| i.to_f } # [34.0, 5.0]
Problem 2: rgrep Utility
This script creates a grep-like utility in Ruby to search plain-text data sets using various options such as word search, pattern matching, and inverse matching.

Usage:
ruby rgrep.rb <filename> [-w|-p|-v|-c|-m] <pattern>
# Example:
ruby rgrep.rb test.txt -w road
Problem 3: Virus Containment Simulation
This script simulates a virus containment scenario in a grid and calculates the number of walls required to stop the virus spread.

Usage:
require './contains_virus'
isInfected = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
result = contain_virus(isInfected)
puts "Number of walls needed: #{result}"
Problem 4: Vehicle Superclass
This script defines a Vehicle superclass and MyCar and MyTruck subclasses, implementing various functionalities like speed control, painting, and towing capacity.

Usage:
require './vehicle'
lumina = MyCar.new(1997, 'chevy lumina', 'white')
puts lumina.speed_up(20)
puts lumina.current_speed
puts lumina.spray_paint("red")
puts MyCar.gas_mileage(13, 351)
puts lumina.to_s
