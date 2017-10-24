Rails.application.routes.draw do
  resources :irradiance_measures
  resources :devices, :path => '/devices'
  

end
