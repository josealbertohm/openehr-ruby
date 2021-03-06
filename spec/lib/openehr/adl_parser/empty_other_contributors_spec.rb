# ticket 179
require File.dirname(__FILE__) + '/../../../spec_helper'
require File.dirname(__FILE__) + '/parser_spec_helper'

describe ADLParser do
  context 'Empty Other Contributors' do
    before(:all) do
      @archetype = adl14_archetype('adl-test-entry.empty_other_contributors.test.adl')
    end

    it 'archetype should be an instance of OpenEHR::AM::Archetype::Archetype' do
      expect(@archetype).to be_an_instance_of OpenEHR::AM::Archetype::Archetype
    end

    it 'other contributer should be nil' do
      expect(@archetype.description.other_contributors).to be_nil
    end
  end
end
