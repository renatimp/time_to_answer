class Question < ApplicationRecord
  ## Association
  belongs_to :subject
  has_many :answers
  accepts_nested_attributes_for :answers

  validates_presence_of :description
end
