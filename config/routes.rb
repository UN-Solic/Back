Rails.application.routes.draw do
  resources :irradiance_measures
  resources :devices, :path => '/devices'
  get 'devices/:id/get_statistics', to: "devices#get_statistics"

end
