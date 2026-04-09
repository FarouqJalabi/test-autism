class Test < ApplicationRecord
  has_many :questions, -> { order(:order) }, dependent: :destroy

  def min_score
    questions.count*0.0
  end

  def max_score
    questions.count*1
  end
end
