require File.dirname(__FILE__) + '/../../../../../spec_helper'
include OpenEHR::RM::Common::Generic
include OpenEHR::RM::Support::Identification

describe PartyProxy do
  before(:each) do
    external_ref = double(PartyRef, :namespace => 'NERV')
    @party_proxy = PartyProxy.new(:external_ref => external_ref)
  end

  it 'should be an isntance of PartyProxy' do
    expect(@party_proxy).to be_an_instance_of PartyProxy
  end

  it 'exnternal_ref.namespace should be NERV' do
    expect(@party_proxy.external_ref.namespace).to eq('NERV')
  end
end
