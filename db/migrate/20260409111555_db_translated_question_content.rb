class DbTranslatedQuestionContent < ActiveRecord::Migration[7.1]
  def up
    Question.find_each do |question|
      I18n.available_locales.each do |locale|
        question.send(:content=, I18n.t("questions.#{question.order}", locale: locale), locale: locale)
        question.save!
      end
    end

    remove_column :questions, :content, :string
  end

  def down
    add_column :questions, :content, :string
  end
end
