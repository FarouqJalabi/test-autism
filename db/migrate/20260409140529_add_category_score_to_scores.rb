class AddCategoryScoreToScores < ActiveRecord::Migration[7.1]
  def change
    add_column :scores, :category_scores, :jsonb
  end
end
