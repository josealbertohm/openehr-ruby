require File.dirname(__FILE__) + '/../../../../../spec_helper'
include OpenEHR::RM::Support::Identification

describe ArchetypeID do
  before(:each) do
    @archetype_id = ArchetypeID.new(:value => 'openEHR-EHR-SECTION.physical_examination-prenatal.v2')
  end

  it 'should be an instance of ArchetypeID' do
    expect(@archetype_id).to be_an_instance_of ArchetypeID
  end

  it 's value should be equal
       openEHR-EHR-SECTION.physical_examination-prenatal.v2' do
    expect(@archetype_id.value).to eq(
      'openEHR-EHR-SECTION.physical_examination-prenatal.v2'
    )
  end
  it 's qualified_rm_entity should be openEHR-EHR-SECTION' do
    expect(@archetype_id.qualified_rm_entity).to eq('openEHR-EHR-SECTION')
  end

  it 's rm_originator should be openEHR' do
    expect(@archetype_id.rm_originator).to eq('openEHR')
  end

  it 's rm_name should be EHR' do
    expect(@archetype_id.rm_name).to eq('EHR')
  end

  it 'rm_entity should be SECTION' do
    expect(@archetype_id.rm_entity).to eq('SECTION')
  end

  it 's domain_concept should be physical_examination-prenatal' do
    expect(@archetype_id.domain_concept).to eq('physical_examination-prenatal')
  end

  it 's concept name should be physical_examination' do
    expect(@archetype_id.concept_name).to eq('physical_examination')
  end

  it 's specialisation should be prenatal' do
    expect(@archetype_id.specialisation).to eq('prenatal')
  end

  it 's version_id should == v2' do
    expect(@archetype_id.version_id).to eq('v2')
  end

  it 'should raise ArgumentError with wrong id format' do
    expect {
      ArchetypeID.new(:value =>'wrong-format')
    }.to raise_error ArgumentError
  end

  it 'should raise ArgumentError with nil concept name' do
    expect {
      @archetype_id.concept_name = nil
    }.to raise_error ArgumentError
  end

  it 'should raise ArgumentError with wrong domain concept format' do
    expect {
      @archetype_id.domain_concept = '0123'
    }.to raise_error ArgumentError
  end

  it 'should raise ArgumentError with empty rm_entity' do
    expect {
      @archetype_id.rm_entity = ''
    }.to raise_error ArgumentError
  end

  it 'should raise ArgumentError with nil rm_entity' do
    expect {
      @archetype_id.rm_entity = nil
    }.to raise_error ArgumentError
  end

  it 'should raise ArgumentError with empty rm_originator' do
    expect {
      @archetype_id.rm_originator = ''
    }.to raise_error ArgumentError
  end

  it 'should raise ArgumentError with nil rm_originator' do
    expect {
      @archetype_id.rm_originator = nil
    }.to raise_error ArgumentError
  end

  it 'should raise ArgumentError with empty specialisation' do
    expect {
      @archetype_id.specialisation = ''
    }.to raise_error ArgumentError
  end

  it 'should not raise ArgumentError with nil specialisation' do
    expect {
      @archetype_id.specialisation = nil
    }.not_to raise_error
  end

  describe 'another constructor' do
    before(:each) do
      @archetype_id = ArchetypeID.new(:rm_originator => 'openEHR',
                                      :rm_name => 'EHR',
                                      :rm_entity => 'EVALUATION',
                                      :concept_name => 'clinical_synopsis',
                                      :version_id => 'v1')
    end

    it 'should be an instance of ArchetypeID' do
      expect(@archetype_id).to be_an_instance_of ArchetypeID
    end

    it 'domain_concept should be clinical_synopsis' do
      expect(@archetype_id.domain_concept).to eq('clinical_synopsis')
    end
  end

  describe 'domain concept' do
    before(:each) do
      @archetype_id.domain_concept = 'progress_note-naturopathy'
    end

    it 'concept_name should be progress note' do
      expect(@archetype_id.concept_name).to eq('progress_note')
    end

    it 'specialisation should be naturopathy' do
      @archetype_id.specialisation === 'naturopathy'
    end

    it 'should raise ArgumentError empty domain concept' do
      expect {
        @archetype_id.domain_concept = ''
      }.to raise_error ArgumentError
    end

    it 'should raise ArgumentError nil domain concept' do
      expect {
        @archetype_id.domain_concept = nil
      }.to raise_error ArgumentError
    end

    it 's specialisation may be empty' do
      @archetype_id.domain_concept = 'clinical_synopsis'
      expect(@archetype_id.concept_name).to eq('clinical_synopsis')
    end
  end
end
