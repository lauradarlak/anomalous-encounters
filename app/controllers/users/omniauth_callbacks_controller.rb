# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # skip_before_filter :require_no_authentication

  # def google_oauth2
  #   @user = User.create_from_provider_data(request.env['omniauth.auth'])
  #   if @user.persisted?
  #     sign_in_and_redirect @user
  #     set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
  #   else
  #     flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
  #     redirect_to new_user_registration_url
  #   end
  # end
  #
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        # flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.log_in_message_html', href: "#{view_context.link_to(t("log_in_href"), finish_signup_path(@user))}".html_safe
        # flash[:notice] = "Your Display Name has been set to blank. #{view_context.link_to('Click here', finish_signup_path(@user))}.".html_safe
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
  end

  # google callback
  # def google_oauth2
  #   @user = User.from_omniauth(request.env['omniauth.auth'])
  #   if @user.persisted?
  #     sign_in_and_redirect @user
  #     set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
  #   else
  #     flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
  #     redirect_to new_user_registration_url
  #   end
  # end
  #
  # def after_sign_in_path_for(resource)
  #   if resource.display_name
  #     super resource
  #   else
  #     finish_signup_path(resource)
  #   end
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
