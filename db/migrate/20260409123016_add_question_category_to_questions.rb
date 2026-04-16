class AddQuestionCategoryToQuestions < ActiveRecord::Migration[7.1]
  def up
    categories = [
      { name: "Social skill" },
      { name: "Attention switching" },
      { name: "Attention to detail" },
      { name: "Communication" },
      { name: "Imagination"}
    ]

    categories.map! do |category|
      Category.i18n.find_or_create_by!(name: category[:name], test: Test.first)
    end

    add_reference :questions, :category, null: false, foreign_key: true, default: categories.first.id
    change_column_default :questions, :category_id, from: 1, to: nil

    Question.where(order: [1,11,13,15,22,36,44,45, 47,48]).update_all(category_id: categories[0].id)
    Question.where(order: [2,4,10,16,25,32,34, 37,43,46]).update_all(category_id: categories[1].id)
    Question.where(order: [5,6,9,12,19,23,28, 29,30,49]).update_all(category_id: categories[2].id)
    Question.where(order: [7,17,18,26,27,31,33, 35,38,39]).update_all(category_id: categories[3].id)
    Question.where(order: [3,8,14,20,21,24,40,41,42,50]).update_all(category_id: categories[4].id)
  end

  def down
    Category.destroy_all
    remove_reference :questions, :category, null: false, foreign_key: true
  end
end
