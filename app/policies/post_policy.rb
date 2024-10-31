class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? && record.users.include?(user)
  end

  def permitted_attributes
    [:content, :user_id, :published, attachments:[]]
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end
