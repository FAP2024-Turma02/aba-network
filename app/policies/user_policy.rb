class UserPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def index?
    true
  end

  def show?
    current_user.admin? || current_user == user  # Admins ou o próprio usuário podem ver seus dados
  end

  def update?
    current_user.admin? || current_user == user  # Admins ou o próprio usuário podem editar seus dados
  end

  def destroy?
    current_user.admin?  # Apenas administradores podem deletar usuários
  end
end
