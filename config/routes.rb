Rails.application.routes.draw do
  resources :irradiance_measures
  resources :devices, :path => '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
