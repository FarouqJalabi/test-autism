class Score < ApplicationRecord
  validates_presence_of :score
  before_create :set_slug

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
