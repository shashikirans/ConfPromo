class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'index'
    end
  end

  def show
    @user = User.find(params[:id])
    @question = Question.find 16
    @choices = Qchoice.where(question_id: @question.id)
    @i = 0
    @p = 0
  end

  def update
    binding.pry
    @uanswer = Uanswer.new(params[:uanswer].permit(:choosen_answer))
    @uanswer.question_id = params[:id]
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :designation, :organization)
  end
end
