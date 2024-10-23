class UserPolicy < ApplicationPolicy
    attr_reader :current_user, :user
  
    def index?
      true
    end
  
    def show?
      true
    end
  
    def update?
      current_user.admin? || current_user == user  # Admins ou o próprio usuário podem editar seus dados
    end
  
    def create?
      true
  
    end
  
    def permitted_attributes
      [:name, :email, :password, :role, :admin, :company_id]
    end
  
    def destroy?
      current_user.admin? || current_user == user  # Apenas administradores podem deletar usuários
    end
end
  