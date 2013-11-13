class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy, :index, :make_admin]
  
  def index
    @users = User.paginate(page: params[:page])    
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    	sign_in @user
      flash[:success] = t(:welkome)
      redirect_to @user
    else
      render 'new'
    end
  end


  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = t(:profile_updated)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def make_admin
    @user = User.find(params[:user_id])
    if @user.toggle!(:admin)
      flash[:success] = "Користувач #{@user.nik} " + ((@user.admin?) ? t(:become_admin) : t(:become_user))
      redirect_to users_url
    else
      flash[:danger] = 'ups!'
      redirect_to users_url
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:nik, :pip, :grade, :avatar,
                                          :password,
                                          :password_confirmation)
    end

    # Before filter
   

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
