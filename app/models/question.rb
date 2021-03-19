class Question < ApplicationRecord
  ## Association
  belongs_to :subject, counter_cache: true,  inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  # Kaminari
  paginates_per 10

  validates_presence_of :description

  # Scopes
  scope :_search_subject_, -> (page, subject_id) {
    Question.includes(:answers)
            .includes(:answers, :subject)
            .where(subject_id: subject_id)
            .page(page)
  }

  scope :_search_, -> (page, term) {
    Question.includes(:answers)
            .includes(:answers, :subject)
            .where("lower(description) LIKE ?", "%#{term.downcase}%")
            .page(page)
  }

  scope :last_questions, -> (page) {
    Question.includes(:answers)
            .includes(:answers, :subject)
            .order('created_at desc')
            .page(page)
  }
end
