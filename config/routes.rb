Rails.application.routes.draw do
  resources :humidity_measures
  resources :temp_measures
  resources :wind_measures
  resources :irradiance_measures
  resources :devices, :path => '/devices'
  get 'devices/:id/get_statistics', to: "devices#get_statistics"

end
