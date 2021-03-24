class QuestionMailer < ApplicationMailer
  def create_question(current_admin, question)
    @current_admin = current_admin
    @question = question
    mail(to: @current_admin.email, subject:"Cadastrado questão!")
  end
end
