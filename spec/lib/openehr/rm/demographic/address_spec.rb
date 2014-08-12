require File.dirname(__FILE__) + '/../../../../spec_helper'
include OpenEHR::RM::Demographic
include OpenEHR::RM::DataTypes::Text
include OpenEHR::RM::DataStructures::ItemStructure

describe Address do
  before(:each) do
    name = DvText.new(:value => 'address')
    details = double(ItemStructure, :archetype_node_id => 'at0001')
    @address = Address.new(:archetype_node_id => 'at0000',
                           :name => name,
                           :details => details)
  end

  it 'should be an instance of Address' do
    expect(@address).to be_an_instance_of Address
  end

  it 'type is inherit from name' do
    expect(@address.type.value).to eq('address')
  end

  it 'details should be assigned properly' do
    expect(@address.details.archetype_node_id).to eq('at0001')
  end

  it 'should raise ArgumentError with nil details' do
    expect {
      @address.details = nil
    }.to raise_error ArgumentError
  end
end

