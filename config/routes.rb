Rails.application.routes.draw do

    root to: 'recipes#index'

    get '/recipes/*id', format: false,  to:'recipes#show', as: 'show_one'

    resources :recipes, :except => [:show]

end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
