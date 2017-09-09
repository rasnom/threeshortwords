require 'json'

class ThesaurusService
  attr_reader :name, :api_key

  def initialize
    @name = 'generic thesaurus'
    @api_key = ENV['BIG_HUGE_THESAURUS_API_KEY']
  end

  def synonym(word)
    return [] if word == '' 

    url = 'http://words.bighugelabs.com/api/2/'
    url += @api_key + '/'
    url += word + '/json'
    response = HTTParty.get(url)
    hash = JSON.parse(response)
    result = []
    hash.each_value do |sub_hash|
      result += sub_hash['syn']
    end
    
    result
  end

end

