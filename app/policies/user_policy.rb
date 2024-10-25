class UserPolicy < ApplicationPolicy
    def index?
      true
    end
  
    def show?
      true
    end
  
    def update?
      user.admin? || user.id == record.id  
    end
  
    def create?
      user.admin?
    end
  
    def permitted_attributes
      [:name, :email, :password, :role, :admin, :company_id]
    end
  
    def destroy?
      user.admin? || user.id == record.id
    end

    class Scope < ApplicationPolicy::Scope
      def resolve
        scope.all
      end
    end
end
  