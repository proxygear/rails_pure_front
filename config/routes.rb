Rails.application.routes.draw do
  get '/' => 'views#index'
  get '/templates/*path' => 'views#show'
end
