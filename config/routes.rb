Rails.application.routes.draw do
  
  root 'institutions#index'

  resources :institutions do
  	resources :courses do
  		resources :lessons
  	end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
