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
    @question_ids = Question.all.collect(&:id)
    @question = Question.find @question_ids.sample
    @choices = Qchoice.where(question_id: @question.id)
    @i = 0
  end

  def check_quiz
    @uanswer = Uanswer.new(params[:uanswer].permit(:choosen_answer))
    @uanswer.question_id = params[:question_id]
    @uanswer.user_id = params[:user_id]
    @q= Question.find params[:question_id]
    if @q.answer_id == @uanswer.choosen_answer
      @uanswer.result = true
    else
      @uanswer.result = false
    end
    @uanswer.save
    respond_to do |format|
      format.js {redirect_to user_question_user_path}
    end
  end

  def user_question
    @user = User.find params[:id]
    @question_ids = Question.all.collect(&:id)
    @question = Question.find @question_ids.sample
    @choices = Qchoice.where(question_id: @question.id)
    @i = 0
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :designation, :organization)
  end
end
