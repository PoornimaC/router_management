Rails.application.routes.draw do
  resources :strengths

  resources :routers

  #root to: '/'

  mount RailsAdmin::Engine => '/', as: 'rails_admin'

end
