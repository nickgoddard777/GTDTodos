GTDTodos::Application.routes.draw do
  devise_for :users

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'

  resources :projects

  root :to => "pages#home"

end

