class Question < ApplicationRecord
  belongs_to :test

  # Checks is test exists,
  validates_associated :test
end
