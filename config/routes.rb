Rails.application.routes.draw do
  devise_for :admins
  devise_for :employees

  authenticated :admin do
    resources :admins, module: 'admin', exept: [:index, :destroy, :new]
    resources :employees, module: 'admin'
    resources :posts, module: 'admin'
  end

  authenticated :employee do
    resources :employees, module: 'employee', only: [:show, :edit, :update]
    resources :posts, module: 'employee', only: [:index, :show]
  end

  root to: 'welcome#index'
end
