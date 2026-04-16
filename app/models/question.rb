class Question < ApplicationRecord
  extend Mobility
  translates :content, type: :string

  belongs_to :test do
    def choices(test)
      test.choices.map()
    end
  end
  belongs_to :category, optional: true # Wait til migrations have run
  after_initialize :set_default_order, if: :new_record?

  def set_default_order
    # self.category = Category.first

    if test.questions.present?
      self.order = test.questions.length+1 # What happends if we create multiple?
    else
      self.order = 1
    end
  end
end
