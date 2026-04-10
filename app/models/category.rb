class Category < ApplicationRecord
  extend Mobility
  translates :name, type: :string
  translates :description, type: :string

  belongs_to :test
  has_many :questions

  def min_score
    questions.count*0
  end

  def max_score
    questions.count*1
  end
end
