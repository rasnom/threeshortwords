class ApiV1Controller < ApplicationController

	def index
		response = []
		render json: response
	end



	# private

	# 	def user_params
	# 		params.permit(:words)
	# 	end
end
