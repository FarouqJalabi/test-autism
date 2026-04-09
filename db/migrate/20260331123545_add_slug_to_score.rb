class AddSlugToScore < ActiveRecord::Migration[7.1]
  def up
    add_column :scores, :slug, :string

    say_with_time "Generating unique slugs" do
      Score.find_each do |score|
        score.update_column(:slug, find_unique_slug)
      end
    end

    change_column_null :scores, :slug, false
    add_index :scores, :slug, unique: true
  end

  def down
    remove_column :scores, :slug
  end

  def find_unique_slug
    loop do
      slug = SecureRandom.base58
      return slug unless Score.exists?(slug: slug)
    end
  end
end
