class Category < ApplicationRecord
  extend Mobility
  translates :name, type: :string

  belongs_to :test
  has_many :questions

  def min_score
    questions.count*test.choices.minimum(:value)
  end

  def max_score
    questions.count*test.choices.maximum(:value)
  end
end
