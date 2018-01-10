require 'rails_helper'

RSpec.describe ApiV1Controller, type: :controller, api: true do

	describe 'GET Index' do
		it 'returns a success' do
			get :index

			expect(response).to be_success
			expect(response.header['Content-Type']).to include 'application/json'
		end

		it 'returns an empty array of synonyms if no words are specified' do
			get :index

			expect(JSON.parse(response.body)).to eq []
		end

		describe 'with one word specified' do
			let(:words) { ['fly'] }

			it 'returns a list of synonyms' do
				get :index, params: { words: words }

				expect(JSON.parse(response.body)).to include('soar', 'flee')
			end
		end

		describe 'with multiple words specified' do
			let(:words) { ['risque', 'azure'] }

			it 'returns a list of common synonyms' do
				get :index, params: { words: words }

				expect(JSON.parse(response.body)).to include 'blue'
			end
		end
	end

end
