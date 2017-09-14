require 'rails_helper'

RSpec.describe 'BigHugeThesaurus' do
  let(:thesaurus) { BigHugeThesaurus.new }

  it 'can create a thesaurus service with a name' do
    expect(thesaurus.name).to eq 'Big Huge Thesaurus'
  end

  it 'has an api key' do
    expect(thesaurus.api_key).to be_a(String)
  end

  describe 'synonym' do
    it 'returns a list of synonyms' do
      allow(HTTParty).to receive(:get).and_return('{"noun":{"syn":["this","and","that"]}}')

      result = thesaurus.synonym('anything')
      expect(result).to be_a(Array)
      expect(result.first).to be_a(String)
    end

    it 'returns an empty array if no word is specified' do
      result = thesaurus.synonym('')
      expect(result).to eq [] 
    end
  end

end
