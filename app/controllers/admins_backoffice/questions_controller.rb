class AdminsBackoffice::QuestionsController < AdminsBackofficeController

  before_action :set_question, only: [:destroy]

  def index
    @questions = Question.all.order(:description).page(params[:page])
  end

  def destroy
    if @question.destroy
      redirect_to admins_backoffice_questions_path, notice: "Questão excluida com sucesso!"
    else
      render :index
    end
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end
end
