class UserController < ApplicationController
  def show
    @user = current_user

    if params[:id]
      @user = User.find(params[:id])
    end

    def delete
    end

  end

  # private
  #
  # def user_not_authorized
  #   flash[:alert] = "You are not cool enough to do this - go back from whence you came."
  #   redirect_to(root_path)
  # end


end
