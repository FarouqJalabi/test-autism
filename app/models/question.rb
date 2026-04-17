class Question < ApplicationRecord
  extend Mobility
  translates :content, type: :string

  belongs_to :test
  belongs_to :category

  after_initialize :set_default_order, if: :new_record?

  def set_default_order
    if test.questions.present?
      self.order = test.questions.length+1 # What happends if we create multiple?
    else
      self.order = 1
    end
  end
end
