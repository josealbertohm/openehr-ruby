require File.dirname(__FILE__) + '/../../../spec_helper'
require File.dirname(__FILE__) + '/parser_spec_helper'
require 'openehr/am/openehr_profile/data_types/text'
include ::OpenEHR::AM::OpenEHRProfile::DataTypes::Text
# ticket 171

describe ADLParser do
  context 'CCodePhase type' do
    before(:all) do
      archetype = adl14_archetype('adl-test-entry.c_code_phrase.test.adl')
      @attributes = archetype.definition.attributes
    end

    def attr(index)
      @attributes[0].children[0].attributes[0].children[index-1].attributes[0].children[0]
    end

    context '1st constraint is icd10::F43.00,F43.01,F32.02' do
      before(:all) do
        @at = attr(1)
      end

      it 'at is an instance of CCodePhrase' do
        expect(@at).to be_an_instance_of CCodePhrase
      end

      it 'terminology id is icd10' do
        expect(@at.terminology_id.value).to eq('icd10')
      end

      it 'code_list is F43.00,F43.01,F32.02' do
        expect(@at.code_list).to eq(['F43.00','F43.01','F32.02'])
      end
    end

    context '2nd constraint is local::at1311,at1312,at1313,at1314,at1315' do
      before(:all) do
        @at = attr(2)
      end

      it 'terminology id is local' do
        expect(@at.terminology_id.value).to eq('local')
      end

      it 'code_list is at1311,at1312,at1313,at1314,at1315' do
        expect(@at.code_list).to eq(['at1311','at1312','at1313','at1314','at1315'])
      end
    end

    context '3rd constraint is icd10::' do
      before(:all) do
        @at = attr(3)
      end

      it 'terminology id is icd10' do
        expect(@at.terminology_id.value).to eq('icd10')
      end

      it 'code_list is empty' do
        expect(@at.code_list).to eq([])
      end
    end

    context '4th constraint is icd10::F43.00,F43.01,F32.02;F43.00' do
      before(:all) do
        @at = attr(4)
      end

      it 'terminology id is icd10' do
        expect(@at.terminology_id.value).to eq('icd10')
      end

      it 'code_list is F43.00,F43.01,F32.02' do
        expect(@at.code_list).to eq(['F43.00','F43.01','F32.02'])
      end

      it 'assumed value is F43.00' do
        expect(@at.assumed_value).to eq('F43.00')
      end
    end

    context '5th constraint is openehr::431' do
      before(:all) do
        @at = attr(5)
      end

      it 'terminology is openehr' do
        expect(@at.terminology_id.value).to eq('openehr')
      end

      it 'code_list is 431' do
        expect(@at.code_list).to eq(['431'])
      end
    end
  end
end
