class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
end
