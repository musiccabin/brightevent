Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', { to: 'welcome#index', as: :root }
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
<<<<<<< HEAD

  resources :events
=======
  resources :events
 
>>>>>>> c1422fd56514597f5e2f24f64acbc4ee03409148
end
