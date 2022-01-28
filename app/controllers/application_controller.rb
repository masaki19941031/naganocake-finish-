class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource_or_scope)
    #アドミのログアウト後はアドミのログインへ
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
        #アドミ以外（会員）のログアウト後はルートへ
    end
  end





  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number])
  end


end
