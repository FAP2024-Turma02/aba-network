class CompanyPolicy < ApplicationPolicy
  attr_reader :current_user, :company

  def index?
    current_user.admin?  
  end

  def show?
    current_user.present? && current_user.admin?  
  end

  def create?
    current_user.admin?  
  end

  def update?
    current_user.admin?  
  end

  def destroy?
    current_user.admin?  
  end

  class Scope < Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if @user&.admin? # Use safe navigation operator para evitar erro se @user for nil
        @scope.all  
      else
        @scope.none  
      end
    end
  end
end
