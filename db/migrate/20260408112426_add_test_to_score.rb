class AddTestToScore < ActiveRecord::Migration[7.1]
  def change
    add_reference :scores, :test, null: false, foreign_key: true, default: 1
    change_column_default :scores, :test_id, from: 1, to: nil
  end
end
