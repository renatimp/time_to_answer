class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    #@total_users = AdminStatistic.total_users
    #@total_questions = AdminStatistic.total_questions
    respond_to do |format|
      format.html { @total_users = AdminStatistic.total_users
                    @total_questions = AdminStatistic.total_questions  }
      format.pdf { @users = User.all.order(:id).includes(:user_profile)
                   @questions = Question.all.order(:created_at)}
    end
  end
end
