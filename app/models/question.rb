class Question < ApplicationRecord
  extend Mobility
  translates :content, type: :string

  belongs_to :test
  belongs_to :category, optional: true # Wait til migrations have run
  before_create :set_order

  private

  def set_order
    if test.questions.present?
      self.order = test.questions.last.order+1
    else
      self.order = 1
    end
  end
end
