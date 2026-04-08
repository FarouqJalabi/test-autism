class Test < ApplicationRecord
  has_many :questions, -> { order(:order) }, dependent: :destroy
end
