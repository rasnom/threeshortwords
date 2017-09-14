require_relative 'thesaurus_service'

class BigHugeThesaurus < ThesaurusService

  def initialize
    @name = 'Big Huge Thesaurus'
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

