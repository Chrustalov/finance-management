class CreditsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_credit
  before_action :set_credit, only: %i[destroy edit update]

  def new 
    @credit = Credit.new 
  end

  def create
    @credit = current_user.credits.build(credit_params)
    if @credit.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def edit 
  end

  def update 
    if @credit.update credit_params
      redirect_to root_path
    else 
      render :edit
    end
  end

  def destroy 
    credit.destroy
    redirect_to root_path
  end


private
  def authorize_credit
    authorize :credit
  end

  def set_credit 
    @credit = Credit.find_by id: params[id:]
  end

  def credit_params 
    params.require(:credit).permit(:value, :user_id)
  end

end