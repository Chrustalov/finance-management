class StatisticController < ApplicationController 
  
  before_action :authorize_static
  def index
    @credits = Credit.where(user_id: current_user.id)
    @deposits = Deposit.where(user_id: current_user.id)
    @outlays = Outlay.where(user_id: current_user.id)
    @incomes = Income.where(user_id: current_user.id)
  end

  private

  def authorize_static
    authorize :statistic
  end
end