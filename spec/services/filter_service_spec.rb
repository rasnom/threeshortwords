require 'rails_helper'

RSpec.describe 'FilterService' do
  let(:filter) { FilterService.new }

  it 'can create a filter object' do
    expect(filter).to_not be_nil
  end


end
