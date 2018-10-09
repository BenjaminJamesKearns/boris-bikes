require 'docking_station'
require 'bike'

describe DockingStation do
  let(:bike) {double :bike}
  let(:bike2) {double :bike}
  it "checks release_bike method" do 
    is_expected.to respond_to(:release_bike)
  end
  it "checks the bike is working" do 
    expect(bike).to be_working
  end
  it "dock a bike in a station" do
    expect(subject.dock(bike)).to eq [bike]
  end
  it "responds to .bike method" do
    is_expected.to respond_to(:bikes)
  end
  it "looks at bikes that are docked" do
    subject.dock(bike)
    expect(subject.bikes[0]).to eq bike 
  end
  describe '#release_bike' do
    it "releases a bike" do 
      subject.dock(bike)
      expect(subject.release_bike).to eq bike 
    end
    it "raises an error when there are no bikes available" do 
      expect{subject.release_bike}.to raise_error 'No bikes available'
    end
  end
  describe '#dock' do
    it 'raises an error when docking station is full' do
      subject.capacity.times {subject.dock(bike)}
      expect{subject.dock(bike)}.to raise_error 'Docking station full'
    end
  end
  describe 'initialization' do 
    it "sets a docking station capacity" do 
      station = DockingStation.new 25
      25.times{station.dock bike}
      expect{station.dock bike}.to raise_error 'Docking station full' 
    end
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end
  it 'releases a working bike' do
    bike.report_broken 
    subject.dock(bike)
    subject.dock(bike2)
    expect(subject.release_bike).to eq bike2
  end
end