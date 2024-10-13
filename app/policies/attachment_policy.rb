class AttachmentPolicy < ApplicationPolicy
  def show?
    true 
  end

  def index?
    true 
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end
