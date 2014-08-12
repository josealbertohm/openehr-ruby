require File.dirname(__FILE__) + '/../../../../../spec_helper'
#require File.dirname(__FILE__) + '/shared_examples_spec'
include OpenEHR::RM::Common::ChangeControl
include OpenEHR::RM::DataTypes::Text
require 'set'

describe ImportedVersion do
#  it_should_behave_like 'change_control'

  before(:each) do
    uid = ObjectVersionID.new(:value => 'ABCD::EFG::2')
    preceding_version_uid = ObjectVersionID.new(:value => 'HIJ::KLM::1')
    commit_audit = double(AuditDetails, :committer => 'UNKNOWN', :empty? => false)
    contribution = ObjectRef.new(:namespace => 'local',
                                 :type => 'CONTRIBUTION',
                                 :id => object_id)
    defining_code = double(CodePhrase, :code_string => '532')
    lifecycle_state = double(DvCodedText, :defining_code => defining_code)
    signature = '4760271533c2866579dde347ad28dd79e4aad933'
    @version = Version.new(:uid => uid,
                           :preceding_version_uid => preceding_version_uid,
                           :data => 'data',
                           :contribution => contribution,
                           :lifecycle_state => lifecycle_state,
                           :commit_audit => commit_audit,
                           :signature => signature)
    attestations = double(Array, :empty? => false, :size => 12)
    other_input_version_uids = double(Set, :empty? => false, :size => 5)
    @original_version = OriginalVersion.new(:uid => uid,
                                            :lifecycle_state => lifecycle_state,
                                            :attestations => attestations,
                                            :commit_audit => commit_audit,
                                            :contribution => contribution,
                                            :other_input_version_uids => other_input_version_uids,
                                            :preceding_version_uid => preceding_version_uid)
    @imported_version = ImportedVersion.new(:item => @original_version,
                                            :commit_audit => commit_audit,
                                            :contribution => contribution)
  end

  it 'should be an instance of ImportedVersion' do
    expect(@imported_version).to be_an_instance_of ImportedVersion
  end

  it 'uid should be item.uid' do
    expect(@imported_version.uid.value).to eq('ABCD::EFG::2')
  end

  it 'lifecycle_state should be item.lifecycle' do
    expect(@imported_version.lifecycle_state.defining_code.code_string).to eq('532')
  end

  it 'preceding_version_uid should be item.preceding_version_uid' do
    expect(@imported_version.preceding_version_uid.value).to eq('HIJ::KLM::1')
  end

  it 'should raise ArgumentError when item is nil' do
    expect {
      @imported_version.item = nil
    }.to raise_error ArgumentError
  end
end
