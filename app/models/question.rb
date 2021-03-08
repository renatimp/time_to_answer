class Question < ApplicationRecord
  belongs_to :subject
  validates_presence_of :description
end
