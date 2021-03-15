class Question < ApplicationRecord
  ## Association
  belongs_to :subject, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  # Kaminari
  paginates_per 10

  validates_presence_of :description

  def self.search(page, term)
    Question.includes(:answers)
            .where("lower(description) LIKE ?", "%#{term.downcase}%")
            .page(page)
  end

  def self.last_questions(page)
    Question.includes(:answers).order('created_at desc').page(page)
  end
end
