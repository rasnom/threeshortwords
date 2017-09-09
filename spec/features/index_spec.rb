require 'rails_helper'

RSpec.feature "Index", type: :feature do
  
  describe 'the root main page' do
    before(:each) do 
      visit '/'
    end

    it 'includes the title of the site' do
      expect(page).to have_content 'Three Short Words'
    end

    describe 'searching for the synonym intersection of two words' do
      before(:each) do
        fill_in('first_word', :with => 'azure')
        fill_in('second_word', :with => 'sad')
        click_button('Submit')
      end

      it 'displays the searched words on the results page' do
        expect(find_field('first_word').value).to eq 'azure'
	expect(find_field('second_word').value).to eq 'sad'
      end
    end
  end

end
