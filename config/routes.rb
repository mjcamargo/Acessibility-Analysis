Rails.application.routes.draw do
  resources :quickcheckers
  root to: 'pages#home'

  get 'report' => 'pages#report'
  get 'compare' => 'pages#compare'
  get 'quickchecker' => 'quickcheckers#index'

end
