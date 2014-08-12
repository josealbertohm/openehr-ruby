require File.dirname(__FILE__) + '/../../../../../../spec_helper'
include OpenEHR::RM::Composition::Content::Entry
include OpenEHR::RM::DataTypes::Text

describe IsmTransition do
  before(:each) do
    current_state = double(DvCodedText, :value => 'planned')
    transition = double(DvCodedText, :value => 'scheduled')
    careflow_step = double(DvCodedText, :value => 'completed')
    @ism_transition = IsmTransition.new(:current_state => current_state,
                                        :transition => transition,
                                        :careflow_step => careflow_step)
  end

  it 'should be an instance of IsmTransition' do
    expect(@ism_transition).to be_an_instance_of IsmTransition
  end

  it 'current_status should be assigned properly' do
    expect(@ism_transition.current_state.value).to eq('planned')
  end

  it 'should raise ArgumentError with nil current state' do
    expect {
      @ism_transition.current_state = nil
    }.to raise_error ArgumentError
  end

  it 'should raise ArgumentError when current_state has invalid code'

  it 'transition should be assined properly' do
    expect(@ism_transition.transition.value).to eq('scheduled')
  end

  it 'should raise ArgumentError with nil transition' do
    expect {
      @ism_transition.transition = nil
    }.to raise_error ArgumentError
  end

  it 'should raise ArugmentError with invalid transition code'

  it 'careflow_step should be assigned properly' do
    expect(@ism_transition.careflow_step.value).to eq('completed')
  end
end
