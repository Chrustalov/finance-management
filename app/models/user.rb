class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :outlays
  has_many :credits
  has_many :deposits
  attribute :balance, default: 0
  attribute :deposit, default: 0
  attribute :credit, default: 0
  has_many :incomes

  def update_balance 
    self.update(balance: (calculate_total_income - calculate_total_outlay) + self.credits.sum(:value) - (self.deposits.sum(:value)))
  end

  def update_credit
    self.update(credit: self.credits.sum(:value))
  end

  def update_deposit
    self.update(deposit: self.deposits.sum(:value))
  end

  private 
    def calculate_total_income 
      return self.incomes.sum(:value)
    end

    def calculate_total_outlay 
      return self.outlays.sum(:value)
    end
end
