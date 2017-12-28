require 'rails_helper'

describe "Thesaurus API", type: :request, api: true do

	describe 'empty request' do
		it 'returns an empty list' do
			get '/api/v1'

			expect(response).to be_success
			expect(JSON.parse(response.body)).to eq []
		end
	end

	describe 'single word request' do
		xit 'returns a list of synonyms' do
			get '/api/v1', params: { words: ['flat'] }

			expect(response).to be_success
			expect(response.header['Content-Type']).to include 'application/json'
			synonyms = JSON.parse(response.body)
			expect(synonyms).to include("flush", "horizontal", "apartment")
		end
	end


end