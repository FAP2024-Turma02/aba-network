class UsersController < ApplicationController
  def index
    authorize User
    @users = policy_scope(User).order(created_at: :desc)
    
    render json: @users.map { |user| UserSerializer.call(user) }
  end

  def show
    authorize user

    render json: UserSerializer.call(user)
  end

  def create
    authorize User
    @user = User.create!(permitted_attributes(User))

    render json: UserSerializer.call(@user), status: :created
  end
  

  def update
    authorize user
    user.update!(permitted_attributes(User))

    render json: UserSerializer.call(user), status: :ok
  end
  
  private

  def user
    @user ||= User.find(params[:id])
  end
end