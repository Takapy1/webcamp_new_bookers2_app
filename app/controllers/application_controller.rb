class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def authenticate_user
    redirect_to new_user_session_path if current_user.nil?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  # ログイン後の遷移先指定
  def after_sign_in_path_for(resource)
    current_user
  end

  # ユーザ登録後の遷移先指定
  def after_sign_up_path_for(resource)
    current_user
  end

   # 与えられたユーザーがログイン済みユーザーであればtrueを返す
  def current_user?
    user == current_user
  end
end
