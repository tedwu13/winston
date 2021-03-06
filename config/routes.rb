Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#home'
  get 'about', to: 'welcome#about'
  get 'connected', to: 'welcome#connected'
  get 'construction', to: 'welcome#construction'

  resources :dashboard, only: [:index]

  # devise_for :users, skip: :registrations, controllers: {
  #   sessions: 'users/sessions'
  # }
  devise_for :students
  devise_for :experts

  get 'signup', to: "users#new"

  resources :users, except: [:index, :new]

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resources :survey, only: [:index, :show]
  resources :answers, only: [:create]

  resources :charges, only: [:new, :create]

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
end
