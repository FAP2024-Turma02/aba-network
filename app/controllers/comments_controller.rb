class CommentsController < ApplicationController
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
    @comment = Comment.new(permitted_attributes(Comment))
    
    if params[:post_id]
      @comment.commentable = Post.find(params[:post_id])
    elsif params[:comment_id]
      @comment.commentable = Comment.find(params[:comment_id])
    else
      return render json: { error: 'O comentário deve estar associado a uma postagem ou outro comentário'}, status: :unprocessable_entity
    end
    
    authorize @comment
  
    if @comment.save
      render json: CommentSerializer.call(@comment), status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update 
    authorize @comment

    if @comment.update(permitted_attributes(Comment))
      render json: CommentSerializer.call(@comment), status: :ok
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def comment
    @comment ||= Comment.find(params[:id])
  end
end
