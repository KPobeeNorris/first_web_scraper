require 'scraper'
require 'spec_helper'

RSpec.describe Scraper do

  describe '#get_names', vcr: {cassette_name: 'nike'} do
    it "will get the names of the trainers" do
      expect(subject.get_names[0]).to eq "Nike Air VaporMax Plus"
    end
  end

  describe '#get_prices', vcr: {cassette_name: 'nike'} do
    it "will get the prices of the trainers" do
      expect(subject.get_prices[0]).to eq "£169.95"
    end
  end

  describe '#display', vcr: {cassette_name: 'nike'} do
    it "will display the data for all the trainers" do
      expect(subject.display.count).to eq 60
    end
  end
end
