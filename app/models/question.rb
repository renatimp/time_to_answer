class Question < ApplicationRecord
  ## Association
  belongs_to :subject, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  # Kaminari
  paginates_per 10

  validates_presence_of :description

  # Scopes
  scope :_search_, -> (page, term) {
    Question.includes(:answers)
            .where("lower(description) LIKE ?", "%#{term.downcase}%")
            .page(page)
  }

  scope :last_questions, -> (page) {
    Question.includes(:answers).order('created_at desc').page(page)
  }
end
