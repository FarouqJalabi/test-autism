class Score < ApplicationRecord
  belongs_to :test

  validates_presence_of :score

  before_create :set_slug

  def score_explanation
    @score_explaination ||= ScoreExplanation.find_by(test: test, min_score: ..score, max_score: score..)
  end

  def score_percent
    (score-test.min_score) * 100.0 / (test.max_score-test.min_score)
  end

  def to_param
    slug
  end
  
  private

  def set_slug
    self.slug = loop do
      slug = SecureRandom.base58
      break slug unless Score.exists?(slug: slug)
    end
  end
end
