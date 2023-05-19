class HomeController < ApplicationController 
  before_action :authenticate_user!
  before_action :authorize_home
  def index
    
    @pagy1, @credits = pagy(Credit.where(user_id: current_user.id), items: 8)
    @pagy2, @deposits = pagy(Deposit.where(user_id: current_user.id), items: 8)
    @pagy3, @outlays = pagy(Outlay.where(user_id: current_user.id), items: 8)
    @pagy4, @incomes = pagy(Income.where(user_id: current_user.id), items: 8)
  end

  private

  def authorize_home
    authorize :home
  end
end