Rails.application.routes.draw do
  devise_for :admins
  devise_for :employees

  authenticated :admin do
    resources :employees, module: 'admin'
    resources :posts, module: 'admin'
  end

  authenticated :employee do
    resources :employees, module: 'employee'
  end

  root to: 'welcome#index'
end
