Rails.application.routes.draw do
  resources :quotations
  root to: 'quotations#new'
  post '/:id/update_second_half', to: 'quotations#update_second_half', as: 'update_second_half'
  get 'thank_you', to: 'quotations#thank_you', as: 'thank_you'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
