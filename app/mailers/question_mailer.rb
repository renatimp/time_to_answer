class QuestionMailer < ApplicationMailered

  def respond_question(current_user, question)
    @current_user = current_user
    @question = question
    mail(to: @current_user.email, subject:"Questão respondida!")
  end
end
