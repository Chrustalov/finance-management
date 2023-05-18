class IncomesController < ApplicationController 
  before_action :authenticate_user!
  before_action :authorize_income
  before_action :set_income, only: %i[destroy edit update]
  after_action :update_balance, only: %i[create update destroy]
  def index 
    @incomes = Income.all
  end 

  def new 
    @income = Income.new 
  end

  def create
    @income = current_user.incomes.build(income_params)
    if @income.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def edit 
  end

  def update 
    if @income.update income_params
      redirect_to root_path
    else 
      render :edit
    end
  end

  def destroy 
    @income.destroy
    redirect_to root_path
  end


private
  def authorize_income
    authorize :income
  end

  def update_balance 
    current_user.update_balance
  end

  def set_income 
    @income = Income.find_by id: params[:id]
  end

  def income_params 
    params.require(:income).permit(:value, :coment, :user_id)
  end

end