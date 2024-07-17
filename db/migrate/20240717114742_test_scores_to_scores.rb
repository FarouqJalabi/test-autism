class TestScoresToScores < ActiveRecord::Migration[7.1]
  def change
    rename_table :test_scores, :scores
  end
end
