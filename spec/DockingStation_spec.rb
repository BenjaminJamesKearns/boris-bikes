require 'docking_station'
require 'bike'

describe DockingStation do
  it {expect(subject).to respond_to(:release_bike)}
  it {bike = subject.release_bike 
      expect(bike).to be_working}
end