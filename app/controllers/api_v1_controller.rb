class ApiV1Controller < ApplicationController
	
	

	def index
		thesaurus = WordsAPI.new
    	filter = FilterService.new
				
		words = params[:words]
		if words == nil || words.empty?
			response = []
		else
			individual_synonyms = []
			words.each do |query_word|
				individual_synonyms.push(thesaurus.synonyms(query_word))
			end
			response = individual_synonyms.reduce(individual_synonyms[0], :&)
		end	

		render json: response
	end



	private

	def intersection(synonyms_lists)

	end

	# 	def user_params
	# 		params.permit(:words)
	# 	end
end
