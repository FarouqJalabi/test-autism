class Test < ApplicationRecord
  has_many :questions, -> { order(:order) }, dependent: :destroy
  has_many :categories, dependent: :destroy

  def min_score
    questions.count*0.0
  end

  def max_score
    questions.count*1.0
  end
end
