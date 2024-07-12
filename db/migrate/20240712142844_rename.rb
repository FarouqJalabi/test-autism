class Rename < ActiveRecord::Migration[7.1]
  def change
    rename_table :blog_posts, :blogs 
  end
end
