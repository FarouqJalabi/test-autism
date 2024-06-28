class AddTimeToReadAndImageLinkToBlogPost < ActiveRecord::Migration[7.1]
  def change
    add_column :blog_posts, :image, :string
    add_column :blog_posts, :time_to_read, :integer
  end
end
