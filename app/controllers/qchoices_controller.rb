class QchoicesController < ApplicationController
  def new
    @qchoices=Qchoice.new
  end

  def create
    @question=Question.find_by_id(params[:question_id])
    @qchoice=@question.qchoices.create(qchoice_params)
    @qchoice.save
    redirect_to question_path(@question)
  end

  def show
    @question=Question.find_by_id params[:id]
  end

  private
def qchoice_params
  params.require(:qchoice).permit(:qoption_id, :qoption_text)
end
end
