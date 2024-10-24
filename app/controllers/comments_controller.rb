class CommentsController < ApplicationController
  before_action :commentable, only: %i[show update]
  before_action :comment, only: %i[show update]

  def index
    @comments = policy_scope(Comment).order(created_at: :desc)
    render json: @comments.map { |comment| CommentSerializer.call(comment) }
  end

  def show
    authorize comment
    render json: CommentSerializer.call(@comment)
  end
  
  def create
    @comment = Comment.create(
      permitted_attributes(Comment).merge(
        user: current_user,
        commentable: commentable
      )
    )

    authorize comment 

    if comment.persisted?
      render json: CommentSerializer.call(comment), status: :created
    else
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update 
    authorize comment  

    if comment.update(permitted_attributes(Comment)) 
      render json: CommentSerializer.call(comment), status: :ok
    else
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def commentable
    @commentable ||= if params[:post_id]
                       Post.find_by(id: params[:post_id])
                     elsif params[:comment_id]
                       Comment.find_by(id: params[:comment_id])
                     end
  end

  def comment
    @comment ||= (commentable ? commentable.comments.find_by(id: params[:id]) : Comment.find_by(id: params[:id]))
  end
end
