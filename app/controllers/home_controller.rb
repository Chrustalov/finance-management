class HomeController < ApplicationController 
  before_action :authenticate_user!
  before_action :authorize_home
  def index
    @credits = Credit.where(user_id: current_user.id)
    @deposits = Deposit.where(user_id: current_user.id)
    @outlays = Outlay.where(user_id: current_user.id)
    @incomes = Income.where(user_id: current_user.id)

    @pagy1, @incomes = pagy(@incomes, items: 8)
    @pagy2, @outlays = pagy(@outlays, items: 8)
    @pagy3, @deposits = pagy(@deposits, items: 8)
    @pagy4, @credits = pagy(@credits, items: 8)
  end

  private

  def authorize_home
    authorize :home
  end
end