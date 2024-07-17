class ChangeScoreScoreToTypeFloat < ActiveRecord::Migration[7.1]
  def change
    change_column :scores, :score, :float
  end
end
