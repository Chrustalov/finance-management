class Deposit < ApplicationRecord
  validates :value, presence: true, numericality: { greater_than: 0 }
end
