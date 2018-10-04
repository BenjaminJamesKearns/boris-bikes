require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  def initialize
    @bikes = []
  end
  def release_bike
    empty?
    @bikes.pop
  end
  def dock(bike)
    full? 
    @bikes << bike 
  end
  attr_reader :bikes
  private
  def full?
    fail 'Docking station full' if @bikes.count >= DEFAULT_CAPACITY
  end
  def empty?
    fail 'No bikes available' if @bikes.empty?
  end
end