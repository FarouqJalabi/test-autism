class Blog < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :image_src
  validates_presence_of :image_alt
  validates_presence_of :time_to_read

  scope :recent, -> { order(created_at: :desc).limit(5) }
end
