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
    expect(subject.dock(bike)).to eq [bike]
  end
  it "responds to .bike method" do
    is_expected.to respond_to(:bikes)
  end
  it "looks at bikes that are docked" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes[0]).to eq bike 
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
  describe '#dock' do
    it 'raises an error when docking station is full' do
      subject.capacity.times {subject.dock(Bike.new)}
      expect{subject.dock(Bike.new)}.to raise_error 'Docking station full'
    end
  end
  describe 'initialization' do 
    it "sets a docking station capacity" do 
      station,= DockingStation.new 25
      25.times{station.dock Bike.new}
      expect{station.dock Bike.new}.to raise_error 'Docking station full' 
    end
  let(:bike) { Bike.new }
  it 'defaults capacity' do
    described_class::DEFAULT_CAPACITY.times do
      subject.dock(bike)
    end
    expect{ subject.dock(bike) }.to raise_error 'Docking station full'
  end
  end
end