require 'rspec'
require 'spec_helper'

describe RSA do

  describe "convert_to_rome" do
    before do
      @r_converter = RSA.new()
    end

    it "Returns IV given 4" do
      expect(@r_converter.to_rome(4)).to eq "IV"
    end

  end

end
