Rails.application.routes.draw do

  resources :categories do
    resources :posts, controller: 'categories/posts'
  end

  root 'categories#index'

end
