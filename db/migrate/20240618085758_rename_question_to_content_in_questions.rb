class RenameQuestionToContentInQuestions < ActiveRecord::Migration[7.1]
  def change
    rename_column :questions, :question, :content
    add_column :questions, :negative_key, :boolean, default: false
    add_column :questions, :category, :string
  end
end
