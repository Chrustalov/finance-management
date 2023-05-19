class StatisticController < ApplicationController 
  before_action :authorize_static
  def index
    if params[:max_value].present? && params[:min_value].present?
      @credits = Credit.where(user_id: current_user.id).where('value < ?',params[:max_value]).where('value > ?',params[:min_value])
      @deposits = Deposit.where(user_id: current_user.id).where('value <?',params[:max_value]).where('value > ?',params[:min_value])
      @outlays = Outlay.where(user_id: current_user.id).where('value < ?',params[:max_value]).where('value > ?',params[:min_value])
      @incomes = Income.where(user_id: current_user.id).where('value < ?',params[:max_value]).where('value > ?',params[:min_value])
    elsif params[:max_value].present? 
      @credits= Credit.where(user_id: current_user.id).where('value < ?',params[:max_value])
      @deposits = Deposit.where(user_id: current_user.id).where('value < ?',params[:max_value])
      @outlays = Outlay.where(user_id: current_user.id).where('value < ?',params[:max_value])
      @incomes = Income.where(user_id: current_user.id).where('value < ?',params[:max_value])
    elsif params[:min_value].present? 
      @credits = Credit.where(user_id: current_user.id).where('value > ?',params[:min_value])
      @deposits = Deposit.where(user_id: current_user.id).where('value > ?',params[:min_value])
      @outlays = Outlay.where(user_id: current_user.id).where('value > ?',params[:min_value])
      @incomes = Income.where(user_id: current_user.id).where('value > ?',params[:min_value])
    else
      @credits  = Credit.where(user_id: current_user.id)
      @deposits = Deposit.where(user_id: current_user.id)
      @outlays  = Outlay.where(user_id: current_user.id)
      @incomes  = Income.where(user_id: current_user.id)
    end
  end

  private

  def authorize_static
    authorize :statistic
  end
end