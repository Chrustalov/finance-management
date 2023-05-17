class DepositsController < ApplicationController 
  before_action :authenticate_user!
  before_action :authorize_deposit
  before_action :set_deposit, only: %i[destroy edit update]
  def index 
    @deposits = Deposit.all
  end 

  def new 
    @deposit = Deposit.new 
  end

  def create
    @deposit = Deposit.new deposit_params
    if @deposit.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def edit 
  end

  def update 
    if @deposit.update deposit_params
      redirect_to root_path
    else 
      render :edit
    end
  end

  def destroy 
    deposit.destroy
    redirect_to root_path
  end


private
  def authorize_deposit
    authorize :deposit
  end

  def set_deposit 
    @deposit = Deposit.find_by id: params[id:]
  end

  def deposit_params 
    params.require(:deposit).permit(:value)
  end

end