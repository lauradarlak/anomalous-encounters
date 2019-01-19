class UsersController < ApplicationController
  include SidebarBeforeActions
  before_action :set_user

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        redirect_to root_path, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:display_name)
    end

end
