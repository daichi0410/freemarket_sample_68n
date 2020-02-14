class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  protected

  def configure_permitted_parameters
    # binding.pry
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :last_name, :j_family_name, :j_last_name, :birthday_year, :birthday_month, :birthday_day])
    # ,:addresses_attributes => [:family_name,:last_name,:j_family_name,:j_last_name,:postal_code,:prefectures,:municipality,:number,:details,:phone_number]

  end

end