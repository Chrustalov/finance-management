class Credit < ApplicationRecord
  validates :value, presence: true
end
