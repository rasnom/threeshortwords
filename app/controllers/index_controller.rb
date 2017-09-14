class IndexController < ApplicationController

  def index
    @first_word = params[:first_word]
    @second_word = params[:second_word]
    thesaurus = BigHugeThesaurus.new
    filter = FilterService.new

    if @first_word != nil
      first_synonyms = thesaurus.synonym(@first_word)
    else
      first_synonyms = []
    end
    if @second_word != nil
      second_synonyms = thesaurus.synonym(@second_word)
    else
      second_synonyms = []
    end
    @results = filter.intersection(first_synonyms,second_synonyms)
  end

end

