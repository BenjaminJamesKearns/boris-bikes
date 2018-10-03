require 'docking_station'
require 'bike'

describe DockingStation do
  it "checks release_bike method" do # one-line method: it {expect(subject).to respond_to(:release_bike)}
    is_expected.to respond_to(:release_bike)
  end
  it "checks the bike is working" do 
    bike = subject.release_bike 
      expect(bike).to be_working
    end
  it "dock a bike in a station" do
    bike = Bike.new 
    expect(subject.dock(bike)).to eq bike
  end
  it "responds to .bike method" do
    is_expected.to respond_to(:bike)
  end
  it "looks at bikes that are docked" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike 
  end
end