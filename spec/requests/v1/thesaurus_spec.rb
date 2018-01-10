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
		it 'returns a list of synonyms' do
			get '/api/v1', params: { words: ['flat'] }

			expect(response).to be_success
			expect(response.header['Content-Type']).to include 'application/json'
			synonyms = JSON.parse(response.body)
			expect(synonyms).to include("horizontal", "apartment")
		end

		it 'returns an empty list if there are no synonyms' do
			get '/api/v1', params: { words: ['imaginaryword'] }

			expect(response).to be_success
			expect(response.header['Content-Type']).to include 'application/json'
			synonyms = JSON.parse(response.body)
			expect(synonyms).to eq []
		end
	end

	describe 'multiple word request' do
		it 'returns a list of common synonyms' do
			get '/api/v1', params: { words: ['risque', 'azure'] }

			synonyms = JSON.parse(response.body)
			expect(synonyms).to include 'blue'
		end

		it 'returns an empty list if there are no common synonyms' do
			get '/api/v1', params: { words: ['tree', 'mutton', 'sophisticated'] }

			synonyms = JSON.parse(response.body)
			expect(synonyms).to eq []
		end
	end
end