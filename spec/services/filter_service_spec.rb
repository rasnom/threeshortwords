require 'rails_helper'

RSpec.describe 'FilterService' do
  let(:filter) { FilterService.new }

  it 'can create a filter object' do
    expect(filter).to_not be_nil
  end

  describe 'intersection method' do
    it 'returns the intersection of two lists of strings' do
      first = ['a', 'bat', 'creation', 'id', 'whoops']
      second = ['nemur', 'fruit', 'manatee', 'loopy', 'bat', 'id', 'larp']

      expect(filter.intersection(first,second)).to contain_exactly('id', 'bat')
    end

    it 'returns the full list if the other one is empty' do
      empty = []
      full = ['tippy', 'banana']

      expect(filter.intersection(empty,full)).to match_array(full)
      expect(filter.intersection(full,empty)).to match_array(full)
      expect(filter.intersection(empty,empty)).to match_array(empty)
    end
  end

end
