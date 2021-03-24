class QuestionMailer < ApplicationMailer
  def create_question(current_admin, question)
    @current_admin = current_admin
    @question = question
    mail(to: @current_admin.email, subject:"Cadastrado questão!")
  end

  def respond_question(current_user, question)
    @current_user = current_user
    @question = question
    mail(to: @current_user.email, subject:"Questão respondida!")
  end
end
