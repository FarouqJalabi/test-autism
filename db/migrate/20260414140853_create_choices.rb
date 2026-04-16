class CreateChoices < ActiveRecord::Migration[7.1]
  def up
    create_table :choices do |t|
      t.integer :value, null: false
      t.belongs_to :test, null: false, foreign_key: true

      t.timestamps
    end

    choices = [
      {label: "Disagree", value: 0},
      {label: "Slightly disagree", value: 0},
      {label: "Slightly agree", value: 1},
      {label: "Agree", value: 1}
    ]

    choices.each do |choice|
      Choice.i18n.find_or_create_by!(test: Test.first, label: choice[:label], value: choice[:value])
    end
  end

  def down
    Choice.destroy_all # To delete mobility too
    drop_table :choices
  end
end
