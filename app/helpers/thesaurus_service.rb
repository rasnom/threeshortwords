require 'json'

class ThesaurusService
  attr_reader :name, :api_key

  def initialize
    @name = 'nonfunctional thesaurus'
    @api_key = 'A_PLACEHOLDER_API_KEY'
  end

  def synonyms(word)
    return [] if word == '' 

    [word]    
  end

end

