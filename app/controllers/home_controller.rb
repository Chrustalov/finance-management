class HomeController < ApplicationController 
  before_action :authenticate_user!
  before_action :authorize_home

  def index
    # Код дії
  end

  private

  def authorize_home
    authorize :home
  end
end