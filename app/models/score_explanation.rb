class ScoreExplanation < ApplicationRecord
  extend Mobility
  translates :title, type: :string
  translates :explanation, type: :string
  translates :label, type: :string
  translates :share_label, type: :string

  attribute :score_range, type: :range

  belongs_to :test

  validates_presence_of :min_score
  validates_presence_of :max_score

  before_validation :set_score_range

  # TODO validates score_ranges don't overlap on tests

  private
    def set_score_range
      return unless score_range
      self.min_score = score_range.first
      self.max_score = score_range.last
    end
end
