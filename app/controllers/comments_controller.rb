class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :comment, only: %i[show update]

  def index
    @comments = policy_scope(Comment).order(created_at: :desc)
    render json: @comments.map { |comment| CommentSerializer.call(comment) }
  end

  def show
    authorize @comment
    render json: CommentSerializer.call(@comment)
  end
  
  def create
    @comment = Comment.new(comment_params)
    
    authorize @comment

    if @comment.save
      render json: CommentSerializer.call(@comment), status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update 
    authorize @comment

    if @comment.update(comment_params)
      render json: CommentSerializer.call(@comment), status: :ok
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  rescue Pundit::NotAuthorizedError
    render json: { error: 'Você não tem permissão para atualizar este comentário.' }, status: :forbidden
  end

  private

  def comment
    @comment ||= Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(policy(@comment||Comment).permitted_attributes)
  end
end
