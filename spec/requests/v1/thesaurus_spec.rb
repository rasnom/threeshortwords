require 'rails_helper'

describe "Thesaurus API", type: :request, api: true do

	describe 'single word request' do
		it 'returns a list of synonyms' do
			get '/api/v1', params: { words: ['flat'] }
			expect(response).to be_success
		end
	end
end