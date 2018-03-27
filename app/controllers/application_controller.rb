class ApplicationController < ActionController::Base
  devise_group :user, contains: [:admin, :employee]

  protect_from_forgery with: :exception
end
