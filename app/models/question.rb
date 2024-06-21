class Question < ApplicationRecord
  belongs_to :test

  # Checks is test exists,
  validates_associated :test
  after_validation :set_order


  private
  def set_order
    if self.test.questions.present?
      self.order = self.test.questions.count+1
    else
      self.order = 1
    end
  end

end
