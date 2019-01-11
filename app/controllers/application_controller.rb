class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def redirect_if_not_authorized!
    user = User.find_by(display_name: params[:display_name])
    if user.id != current_user.id
      redirect_to root_path
    end
  end

  def after_sign_in_path_for(resource)
    if resource.display_name.nil?
      flash[:notice] = "Please create a display name #{view_context.link_to('click here', finish_signup_path(resource))}."
    end
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:display_name, :email, :password])
  end
end
