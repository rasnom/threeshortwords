require 'rails_helper'

RSpec.describe 'ThesaurusService' do
  let(:thesaurus) { ThesaurusService.new }

  it 'can create a thesaurus service with a name' do
    expect(thesaurus.name).to be_a(String)
  end

  it 'has an api key' do
    expect(thesaurus.api_key).to be_a(String)
  end

  describe 'synonym' do
    it 'returns a list of words' do
      allow(thesaurus).to receive(:synonym).and_return(['a', 'small', 'list'])

      result = thesaurus.synonym('anything')
      expect(result).to be_a(Array)
      expect(result.first).to be_a(String)
    end
  end

end
