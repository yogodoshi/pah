require 'spec_helper'

FactoryGirl.factories.map(&:name).each do |factory_name|
  describe "The #{factory_name} factory" do
    it { expect(build(factory_name)).to be_valid }
  end
end
