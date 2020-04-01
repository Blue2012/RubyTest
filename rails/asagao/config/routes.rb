Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"
  get "kanechanee" => "top#kanechanee"
  get "lesson/:action(/:name)" => "lesson"
end
