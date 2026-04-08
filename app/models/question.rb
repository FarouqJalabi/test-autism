class Question < ApplicationRecord
  belongs_to :test
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
