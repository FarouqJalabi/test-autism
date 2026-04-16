class AddPublicToTests < ActiveRecord::Migration[7.1]
  def change
    add_column :tests, :visible, :boolean, default: false, null: false
  end
end
