describe "Thesaurus API", type: :request do
	describe 'single word requets' do
		it 'returns a list of synonyms' do
			get '/api/v1', { words: ['flat'] }

			expect(response).to be_success
		end
	end
end