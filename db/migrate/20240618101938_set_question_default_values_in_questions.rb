class SetQuestionDefaultValuesInQuestions < ActiveRecord::Migration[7.1]
  def change
    change_column :questions,:content, :string, default: ""
  end
end