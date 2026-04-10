class ChangeScoresScoreToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :scores, :score, :integer
  end
end
