class AdminsBackoffice::QuestionsController < AdminsBackofficeController

  before_action :set_question, only: [:edit, :update, :destroy]
  before_action :get_subject_options, only: [:new, :create, :edit, :update]

  def show
    @question = Question.find_by(id: params[:question_id])
  end

  def index
    @questions = Question.includes(:subject)
                         .order(:description)
                         .page(params[:page])
  end

  def new
    @question = Question.new
    @subject = Subject.all
  end

  def create
    @question = Question.new(params_question)
    if @question.save
      #QuestionMailer.create_question(current_admin, @question).deliver_now
      redirect_to admins_backoffice_questions_path, notice: "Pergunta cadastrada com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(params_question)
      redirect_to admins_backoffice_questions_path, notice: "Pergunta atualizada com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      redirect_to admins_backoffice_questions_path, notice: "Questão excluida com sucesso!"
    else
      render :index
    end
  end

  private
  def params_question
    params.require(:question).permit(:description, :subject_id,
                                    answers_attributes: [:id, :description, :correct, :_destroy])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def get_subject_options
    @subject_options = Subject.all
  end

end
