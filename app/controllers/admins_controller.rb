class AdminsController < ApplicationController
  def check_admin
    @user = User.find_by_email(params[:email])
    if @user.present? && (@user.has_role? :Admin)
      redirect_to admin_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    @users = User.all
  end
end
