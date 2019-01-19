class UsersController < ApplicationController
  include SidebarBeforeActions

  before_action :set_user
  before_action :redirect_if_not_authorized!

  # GET/PATCH /accounts/:id/finish_signup
  def finish_signup
    if request.patch? && params[:user]
      if @user.update(user_params)
        redirect_to root_path, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  private
    def set_user
      if User.exists?(id: params[:id])
        @user = User.find_by(params[:id])
      else
        flash[:notice] = "User does not exist."
        redirect_to root_path
      end
    end

    def user_params
      params.require(:user).permit(:display_name)
    end

end
