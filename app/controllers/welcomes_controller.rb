class WelcomesController < ApplicationController
	
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = User.posts.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
        redirect_to root_path, notice: "User deleted."
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :user_id, :username, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
