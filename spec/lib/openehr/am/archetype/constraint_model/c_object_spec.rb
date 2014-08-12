require File.dirname(__FILE__) + '/../../../../../spec_helper'
include OpenEHR::AM::Archetype::ConstraintModel
include OpenEHR::AssumedLibraryTypes

describe CObject do
  before(:each) do
    occurrences = Interval.new(:lower => 0, :upper => 1)
    parent = double(CAttribute, :rm_attribute_name => 'DV_DATE')
    @c_object = CObject.new(:path => '/event/[at0001]/',
                            :rm_type_name => 'DV_TIME',
                            :node_id => 'ac0001',
                            :occurrences => occurrences,
                            :parent => parent)
  end

  it 'should be an instance of CObject' do
    expect(@c_object).to be_an_instance_of CObject
  end

  it 'rm_type_name should be assigned properly' do
    expect(@c_object.rm_type_name).to eq('DV_TIME')
  end

  it 'should raise ArgumentError when rm_type_name was assigned nil' do
    expect {
      @c_object.rm_type_name = nil
    }.to raise_error ArgumentError
  end

  it 'should raise ArgumentError when rm_type_name was assigned empty' do
    expect {
      @c_object.rm_type_name = ''
    }.to raise_error ArgumentError
  end

  it 'node_id should be assigned properly' do
    expect(@c_object.node_id).to eq('ac0001')
  end

  # it 'should raise ArgumentError when node_id was assigned nil' do
  #   lambda {
  #     @c_object.node_id = nil
  #   }.should raise_error ArgumentError
  # end

  it 'should raise ArgumentError when node_id was assigned empty' do
    expect {
      @c_object.node_id = ''
    }.to raise_error ArgumentError
  end

  it 'occurences should be assigned properly' do
    expect(@c_object.occurrences.lower).to be_equal 0
  end

  # it 'should raise ArgumentError when occurences was assigned nil' do
  #   lambda {
  #     @c_object.occurrences = nil
  #   }.should raise_error ArgumentError
  # end
end
