Rails.application.routes.draw do
  get '/' => 'views#index'
  get "/#{::Base::TPL_FOLDER}/*path" => 'views#show'
end
