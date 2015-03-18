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
  end

  def update
    @uanswer = Uanswer.new(params[:uanswer].permit(:choosen_answer))
    @uanswer.question_id = params[:question_id]
    @uanswer.user_id = params[:user_id]
    @uanswer.save
    # @q= Question.find params[:question_id]
    # if @q.answer_id == @uanswer.choosen_answer
    # end
    binding.pry
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :designation, :organization)
  end
end
