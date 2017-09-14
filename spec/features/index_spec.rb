require 'rails_helper'

RSpec.feature "Index", type: :feature do
  
  describe 'the root main page' do
    before(:each) do 
      visit '/'
    end

    it 'includes the name of the site in the title' do
      expect(page.title).to have_content 'ThreeShortWords'
    end

    it 'includes a description of the site' do
      expect(page).to have_content 'Synonym Filter'
    end

    it 'includes a search section' do
      expect(page).to have_css '.search-container'
    end

    it 'includes a results section' do
      expect(page).to have_css '.results-container'
    end

    describe 'searching for the synonym intersection of two words' do
      before(:each) do
        fill_in('first_word', :with => 'azure')
        fill_in('second_word', :with => 'risque')
        click_button('MUNGE')
      end

      it 'displays the searched words on the results page' do
        expect(find_field('first_word').value).to eq 'azure'
	expect(find_field('second_word').value).to eq 'risque'
      end

      it 'displays words that match both criteria in the results' do
        expect(page).to have_content('blue')
      end
    end
  end

end
