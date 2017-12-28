class ApiV1Controller < ApplicationController

	def index
		p params
		response = {content: "anything"}
		p response
		render json: response
	end



	# private

	# 	def user_params
	# 		params.permit(:words)
	# 	end
end
