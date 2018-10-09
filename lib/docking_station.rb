require_relative 'bike'

class DockingStation
  
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity 
  end
  
  def release_bike
    empty?
        @bikes.each {|bike|
      if bike.broken? == true
        
      else
        return @bikes.delete(bike)
      end
    }
  end
  
  def dock(bike)
    full? 
    @bikes << bike 
  end
  
  attr_reader :bikes, :capacity 
  
  private
  
  def full?
    fail 'Docking station full' if @bikes.count >= @capacity
  end
  
  def empty?
    fail 'No bikes available' if @bikes.empty?
  end
end