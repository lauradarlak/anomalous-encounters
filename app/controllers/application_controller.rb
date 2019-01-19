class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_exists?, only: [:redirect_if_not_authorized!]

  def user_exists?
    if params[:display_name] && !User.exists?(display_name: params[:display_name])
      redirect_to root_path, alert: "User does not exist!"
    end
  end

  def redirect_if_not_authorized!
    user = User.find_by(display_name: params[:display_name]) || User.find(params[:id])
    if !user_signed_in? || user.id != current_user.id
      flash[:notice] = "Must be logged in to access."
      redirect_to root_path
    end
  end

  def after_sign_in_path_for(resource)
    if resource.display_name.nil?
      finish_signup_url(resource)
      # flash[:notice] = "Please create a display name #{view_context.link_to('click here', finish_signup_path(resource))}."
    else
      root_path
    end

  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:display_name, :email, :password])
  end
end
