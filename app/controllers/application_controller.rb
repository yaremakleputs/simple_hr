class ApplicationController < ActionController::Base
  devise_group :user, contains: [:admin, :employee]

  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    posts_path
  end
end
