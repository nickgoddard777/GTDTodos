GTDTodos::Application.routes.draw do
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'

  get "pages/home"
  get "pages/contact"
  get "pages/about"

  root :to => "pages#home"

end

