class DomainPolicy < ApplicationPolicy
  def index?
    user.admin? || user.moderator?
  end

  def show?
    user.admin? || user.moderator?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def permitted_attributes
    [:domain_url]
  end

  class Scope < Scope
    def resolve
      if user.admin? || user.moderator?
        scope.all
      else
        scope.none
      end
    end
  end
end
