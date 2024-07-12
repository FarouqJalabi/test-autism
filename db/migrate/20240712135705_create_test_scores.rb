class CreateTestScores < ActiveRecord::Migration[7.1]
  def change
    create_table :test_scores do |t|
      t.integer :score

      t.timestamps
    end
  end
end
