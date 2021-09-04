Rails.application.routes.draw do
  resources :posts do
    resources :comments, shallow: true,
               except: [:index, :show, :new]
  end
  

  root 'posts#index'
end
