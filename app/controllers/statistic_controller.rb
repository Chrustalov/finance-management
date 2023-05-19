class StatisticController < ApplicationController
  before_action :authorize_static

  def reset_variable
    @CHECKER = 1
    redirect_to statistic_path
  end

  def index
    @min_value = params[:statistic]&.fetch(:min_value, nil)
    @max_value = params[:statistic]&.fetch(:max_value, nil)
    @min_time = params[:statistic]&.fetch(:min_time, nil)
    @max_time = params[:statistic]&.fetch(:max_time, nil)

    if @CHECKER == 1
      @min_value = nil
      @max_value = nil
      @CHECKER = 0
    end

    if params[:max_value].present?
      @credits = @credits.where('value < ?',params[:max_value])
      @deposits = @deposits.where('value <?',params[:max_value])
      @outlays = @outlays.where('value < ?',params[:max_value])
      @incomes = @incomes.where('value < ?',params[:max_value])
    end

    if params[:min_value].present?
      @credits = @credits.where('value > ?',params[:min_value])
      @deposits = @deposits.where('value > ?',params[:min_value])
      @outlays = @outlays.where('value > ?',params[:min_value])
      @incomes = @incomes.where('value > ?',params[:min_value])
    end

    current_time = Time.now

    if params[:max_time].present? && (params[:max_time] < current_time)
      time = Time.parse(params[:max_time])
      @credits = @credits.where('created_at < ?', time)
      @deposits = @deposits.where('created_at < ?', time)
      @outlays = @outlays.where('created_at < ?', time)
      @incomes = @incomes.where('created_at < ?', time)
    end
    

    if params[:min_time].present? &&  (params[:min_time] < current_time)
      time = Time.parse(params[:min_time])
      @credits = @credits.where('created_at > ?', time)
      @deposits = @deposits.where('created_at > ?', time)
      @outlays = @outlays.where('created_at > ?', time)
      @incomes = @incomes.where('created_at > ?', time)
    end
  end
  private

  def authorize_static
    authorize :statistic
  end
end