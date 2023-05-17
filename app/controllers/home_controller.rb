class HomeController < ApplicationController 
  before_action :authenticate_user!
  before_action :authorize_home

  def index
    # Код дії
    @credits = Credit.all
    @deposits = Deposit.all
    @outlays = Outlay.all
  end

  private

  def authorize_home
    authorize :home
  end
end