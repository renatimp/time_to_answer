class Site::AnswerController < SiteController
  def question
    @answer = Answer.find(params[:answer_id])
    
    if @answer.correct?
      QuestionMailer.respond_question(current_user, @answer.question.description).deliver_now
    end

    UserStatistic.set_statistic(@answer, current_user)
  end

end
