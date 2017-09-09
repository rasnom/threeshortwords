require 'rails_helper'

RSpec.describe 'ThesaurusService' do
  let(:thesaurus) { ThesaurusService.new }

  it 'can create a thesaurus service' do
    expect(thesaurus.name).to eq 'generic thesaurus'
  end

end
