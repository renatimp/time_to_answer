class Subject < ApplicationRecord
  has_many :questions
  paginates_per 20
  validates_presence_of :description
end
