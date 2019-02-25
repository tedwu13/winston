class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def new
    @user = User.new
    if request.path == experts_signup_path
      @user.is_expert = true
    end

  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Winston #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def show
    if current_user.nil?
      redirect_to root_path
      return
    end
    user_id = params[:id]
    if user_id.to_i != current_user.id
      redirect_to user_path(current_user)
    end
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User has been deleted"
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    if params[:user][:is_expert].present?
      return params.require(:user).permit(:username, :email, :password, :phone_number, :university).merge(is_expert: true)
    else
      return params.require(:user).permit(:username, :email, :password, :phone_number, :university).merge(is_expert: false)
    end
  end


  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? && !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to root_path
    end
  end
end
