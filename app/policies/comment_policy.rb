class CommentPolicy < ApplicationPolicy
  def show?
    true
  end

  def index?
    true
  end

  def create?
    user.present? 
  end

  def new?
    create?
  end

  def update?
    user.present? && (user == record.user)
  end
  
  def destroy?
    user.present? && (user == record.user)
  end

  def permitted_attributes
      [:content, :commentable_id, :commentable_type, :user_id]
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end
