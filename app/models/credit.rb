class Credit < ApplicationRecord
  validates :value, presence: true
  belongs_to :user
  attribute :value, default: 0
end
