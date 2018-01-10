Rails.application.routes.draw do

  get '/', to: 'index#index'

  get '/api/v1', to: 'api_v1#index'

end
