class Subject < ApplicationRecord
  paginates_per 20
  validates_presence_of :description
end
