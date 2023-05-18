class HomeController < ApplicationController 
  before_action :authenticate_user!
  before_action :authorize_home

  def index
    # Код дії
    @credits = Credit.where(user_id: current_user.id)
    @deposits = Deposit.where(user_id: current_user.id)
    @outlays = Outlay.where(user_id: current_user.id)
    @incomes = Income.where(user_id: current_user.id)    
  end

  private

  def authorize_home
    authorize :home
  end
end