class IndexController < ApplicationController

  def index
    @first_word = params[:first_word]
    @second_word = params[:second_word]
    @results = ['blue']
  end

end
