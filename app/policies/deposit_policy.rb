class DepositPolicy < ApplicationPolicy
  def index? 
    true
  end

  def create?
    true
  end

  def destroy?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end
end
