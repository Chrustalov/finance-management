class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :outlays
  has_many :credits
  has_many :deposits
  has_many :incomes
  attribute :balance, default: 0
  attribute :deposit, default: 0
  attribute :credit, default: 0
end
