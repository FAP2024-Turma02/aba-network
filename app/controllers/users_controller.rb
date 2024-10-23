class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
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

  def show
    authorize @user  # Autoriza a exibição de um único usuário
    render json: @user
  end

  def create
    user = User.new(user_params)  # Usa os atributos permitidos

    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end


  private
  
  # Usado para buscar o usuário antes das ações específicas
  def set_user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(policy(@user||User).permitted_attributes)
  end
end
