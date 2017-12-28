class ApiV1Controller < ApplicationController
	
	

	def index
		thesaurus = WordsAPI.new
    	filter = FilterService.new
				
		words = params[:words]
		if words == nil || words.empty?
			response = []
		else
			response = thesaurus.synonyms(words.first)
		end	

		render json: response
	end



	# private

	# 	def user_params
	# 		params.permit(:words)
	# 	end
end
