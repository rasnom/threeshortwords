require 'rails_helper'

describe "Thesaurus API", type: :request do
	include Rack::Test::Methods

	describe 'single word request' do
		it 'returns a list of synonyms' do
			get '/api/v1', { words: ['flat'] }

			expect(response).to be_success
		end
	end
end