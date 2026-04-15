class Choice < ApplicationRecord
  extend Mobility
  translates :label, type: :string

  belongs_to :test

  validates :value, comparison: { greater_than_or_equal_to: 0 }
end
