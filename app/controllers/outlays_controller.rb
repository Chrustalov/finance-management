class OutlaysController < ApplicationController 
  before_action :authenticate_user!
  before_action :authorize_outlay
  before_action :set_outlay, only: %i[destroy edit update]
  after_action :update_balance, only: %i[create update destroy]
  def index 
    @outlays = Outlay.all
  end 

  def new 
    @outlay = Outlay.new 
  end

  def create
    @outlay = current_user.outlays.build(outlay_params)
    if @outlay.save
      flash[:notice] = "Витрату додано успішно"
      redirect_to root_path
    else 
      flash[:alert] = "Витрату не додано"
      render :new
    end
  end

  def edit 
  end

  def update 
    if @outlay.update outlay_params
      
      redirect_to root_path
    else 
      render :edit
    end
  end

  def destroy 
    @outlay.destroy
    flash[:info] = "Витрату видалено"
    redirect_to root_path
  end


private

  def authorize_outlay
    authorize :outlay 
  end

  def update_balance 
    current_user.update_balance
  end

  def set_outlay 
    @outlay = Outlay.find_by id: params[:id]
  end

  def outlay_params 
    params.require(:outlay).permit(:value, :coment, :user_id)
  end

end