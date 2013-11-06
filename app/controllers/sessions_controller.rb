class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(nik: params[:session][:nik])
    if user #&& user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:danger] = I18n.t(:invalid_comb)
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
