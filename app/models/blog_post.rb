class BlogPost < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :image
  validates_presence_of :time_to_read
end
