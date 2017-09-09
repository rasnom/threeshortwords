class IndexController < ApplicationController

  def index
    @first_word = params[:first_word]
    @second_word = params[:second_word]
    thesaurus = ThesaurusService.new
    @results = [thesaurus.name]
  end

end

