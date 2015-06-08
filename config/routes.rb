Rails.application.routes.draw do
  root                'static_pages#home'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  get    'work_logs' => 'work_logger#new'
  post   'work_logs' => 'work_logger#create'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :projects
  resources :tasks
end
