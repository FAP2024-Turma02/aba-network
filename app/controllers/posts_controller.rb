class PostsController < ApplicationController
  before_action :post, only: %i[show]

  def index
    @posts = policy_scope(Post).order(created_at: :desc)
    render json: @posts
  end

  def show
    authorize @post
    render json: post
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end
end
