class Outlay < ApplicationRecord
  validates :value, presence: true, numericality: {greater_than: 0}
  belongs_to :user
  attribute :value, default: 0
end
