class OutlaysController < ApplicationController 
  before_action :authenticate_user!
  before_action :authorize_outlay
  before_action :set_outlay, only: %i[destroy edit update]

  def new 
    @outlay = Outlay.new 
  end

  def create
    @outlay = current_user.outlays.build(outlay_params)
    if @outlay.save
      redirect_to root_path
    else 
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
    redirect_to root_path
  end


private

  def authorize_outlay
    authorize :outlay 
  end


  def set_outlay 
    @outlay = Outlay.find_by id: params[:id]
  end

  def outlay_params 
    params.require(:outlay).permit(:value, :coment)
  end

end