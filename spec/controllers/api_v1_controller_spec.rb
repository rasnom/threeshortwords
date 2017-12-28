require 'rails_helper'

RSpec.describe ApiV1Controller, type: :controller, api: true do

	describe 'GET Index' do
		it 'returns a success' do
			get :index
			expect(response).to be_success
		end
	end

end
