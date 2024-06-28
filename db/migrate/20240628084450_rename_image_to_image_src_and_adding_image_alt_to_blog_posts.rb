class RenameImageToImageSrcAndAddingImageAltToBlogPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :blog_posts, :image_alt, :string
    rename_column :blog_posts, :image, :image_src
  end
end
