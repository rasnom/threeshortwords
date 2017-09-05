require 'rails_helper'

RSpec.feature "Indices", type: :feature do
  
  describe 'the root main page' do
    it 'includes the title of the site' do
      visit '/'
      expect(page).to have_content 'Three Short Words'
    end
  end

end
