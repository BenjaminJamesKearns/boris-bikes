require 'docking_station'
require 'bike'

describe DockingStation do
  it "checks release_bike method" do # one-line method: it {expect(subject).to respond_to(:release_bike)}
    is_expected.to respond_to(:release_bike)
  end
  it "checks the bike is working" do 
    bike = Bike.new 
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
  describe '#release_bike' do
    it "releases a bike" do 
      bike = Bike.new 
      subject.dock(bike)
      expect(subject.release_bike).to eq bike 
    end
    it "raises an error when there are no bikes available" do 
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end
  end
end