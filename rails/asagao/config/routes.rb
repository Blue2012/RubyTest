Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about"
  get "kanechanee" => "top#kanechanee"
end
