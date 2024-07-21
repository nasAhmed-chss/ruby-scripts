module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end

class Vehicle
  @@number_of_vehicles = 0

  attr_accessor :color
  attr_reader :year, :model

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park the #{vehicle_type}!"
  end

  def spray_paint(given_color)
    self.color = given_color
    puts "Your new #{color} paint job looks great!"
  end

  def gas_mileage(gallons, miles)
    puts "#{(miles/gallons.to_f).round} miles per gallon of gas"
  end

  def to_s
    "My #{vehicle_type} is a #{color}, #{year}, #{model}!"
  end

  private

  def vehicle_type
    self.class == MyCar ? 'car' : 'truck'
  end
end

class MyCar < Vehicle
  include Towable

  NUMER_OF_DOORS = 4
    def initialize(year, model, color)
    super
    puts to_s
  end
end

class MyTruck < Vehicle
  include Towable

  NUMER_OF_DOORS = 2

  private

  def vehicle_type
    'truck'
  end
  def initialize(year, model, color)
    super
    puts to_s
  end
end

# Example Usage
lumina = MyCar.new(1997, 'chevy lumina', 'white')
puts lumina.speed_up(20)
puts lumina.current_speed
puts lumina.speed_up(20)
puts lumina.current_speed
puts lumina.to_s
puts lumina.brake(20)
puts lumina.current_speed
puts lumina.brake(20)
puts lumina.current_speed
puts lumina.shut_down
puts lumina.gas_mileage(13, 351)
puts lumina.spray_paint("red")
ram = MyTruck.new(1990, 'GMC', "black")
puts ram.can_tow?(1000)
puts lumina.can_tow?(3000)

