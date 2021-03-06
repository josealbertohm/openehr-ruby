require File.dirname(__FILE__) + '/../../../../../../spec_helper'
require 'openehr/rm/data_types/quantity/date_time'
include OpenEHR::RM::DataTypes::Quantity::DateTime

describe DvDateTime do
  before(:each) do
    @dv_date_time = DvDateTime.new(:value => '2009-09-29T15:03:22.3Z')
  end

  it 'should be an instance of DvDateTime' do
    expect(@dv_date_time).to be_an_instance_of DvDateTime
  end

  it 'magnitude should be 63423697018.3' do
    expect(@dv_date_time.magnitude).to be_within(0.01).of(63423697018.3)
  end

  it 'should be equal when magnitude is same' do
    expect(@dv_date_time).to eq(DvDateTime.new(:value => '2009-09-29T15:03:22.3Z'))
  end

  it 'diff should be caluculated from past to future' do
    future = DvDateTime.new(:value => '2009-10-29T16:23:30.3Z')
    expect(@dv_date_time.diff(future).value).to eq('P0Y1M0W0DT1H20M8.0S')
  end
end
