class Income < ApplicationRecord
  validates :value, presence: true, numericality: {greater_than: 0}
  belongs_to :user
end
