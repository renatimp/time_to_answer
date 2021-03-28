class Site::AnswerController < SiteController
  def question
    @answer = Answer.find(params[:answer_id])
    UserStatistic.set_statistic(@answer, current_user)
    #if @answer.correct?
      #QuestionMailer.respond_question(current_user, @answer.question.description).deliver_now
    #end
  end

end
