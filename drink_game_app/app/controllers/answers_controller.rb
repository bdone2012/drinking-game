class AnswersController < ApplicationController

  def new
    @answer = Answer.new
    @question = Question.find(1)
  end

  def create
    @answer = Answer.new(answer_params)
    @answer[:user_id] = session[:user_id]
    @answer[:question_id] = params[:answer][:question_id]
    if @answer.save
      redirect_to("/users")
    end
  end
    private

    def answer_params
      params.require(:answer).permit(:saved_answer)
    end

end
