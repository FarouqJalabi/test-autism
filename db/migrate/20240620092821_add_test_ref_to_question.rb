class AddTestRefToQuestion < ActiveRecord::Migration[7.1]
  def change
    add_reference :questions, :test, null: false, foreign_key: true
  end
end
