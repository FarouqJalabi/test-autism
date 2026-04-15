class Test < ApplicationRecord
  extend Mobility
  translates :description, type: :string

  has_many :questions, -> { order(:order) }, dependent: :destroy
  has_many :choices, -> { order(:value) }, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :score_explanations, dependent: :destroy

  accepts_nested_attributes_for :questions, allow_destroy: true
  accepts_nested_attributes_for :categories, allow_destroy: true
  accepts_nested_attributes_for :score_explanations, allow_destroy: true
  accepts_nested_attributes_for :choices, allow_destroy: true

  def min_score
    questions.count*0.0
  end

  def max_score
    questions.count*1.0
  end
end
