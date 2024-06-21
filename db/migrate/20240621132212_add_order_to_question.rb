class AddOrderToQuestion < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :order, :integer
  end
end
