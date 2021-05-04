Rails.application.routes.draw do
  get 'tasks'        => 'tasks#index'
  post 'tasks'       => 'tasks#store'
  get 'tasks/:id'    => 'tasks#show'
  put 'tasks/:id'    => 'tasks#update'
  delete 'tasks/:id' => 'tasks#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end