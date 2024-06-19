class RemoveCategoryFromQuestions < ActiveRecord::Migration[7.1]
  def change
    remove_column :questions, :category, :string
  end
end
