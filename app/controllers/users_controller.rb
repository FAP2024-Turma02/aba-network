class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    authorize User  # Autoriza a ação index para o modelo User
    @users = User.all
    render json: @users
  end

  def show
    authorize @user  # Autoriza a exibição de um único usuário
    render json: @user
  end

  private
  
  # Usado para buscar o usuário antes das ações específicas
  def set_user
    @user ||= User.find(params[:id])
  end
end
