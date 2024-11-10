class CommentsController < ApplicationController
  # GET /posts/:post_id/comments ou /comments/:comment_id/comments
  def index
    if params[:post_id]
      post = Post.find(params[:post_id])
      comments = policy_scope(post.comments).order(created_at: :desc)

    elsif params[:comment_id]
      parent_comment = Comment.find(params[:comment_id])
      comments = policy_scope(parent_comment.comments).order(created_at: :desc)
      
    else
      comments = policy_scope(Comment).order(created_at: :desc)
    end

    render json: comments.map { |comment| CommentSerializer.call(comment) }
  end

  # GET /posts/:post_id/comments/:id or /comments/:comment_id/comments/:id
 def show
    comment = Comment.find_by(id: params[:id])
    if comment.nil?
      render json: { error: I18n.t('errors.comment_not_found') }, status: :not_found
    else
      authorize comment
      render json: CommentSerializer.call(comment)
    end
  end

  #POST /posts/:post_id/comments or /comments/:comment_id/comments
  def create
    comment = commentable.comments.create(permitted_attributes(Comment).merge(user: current_user)) 
    authorize comment
    
    render json: CommentSerializer.call(comment), status: :created
  end

  # PATCH /posts/:post_id/comments/:id or /comments/:comment_id/comments/:id
  def update
    authorize comment
    comment.update!(permitted_attributes(Comment))
    
    render json: CommentSerializer.call(comment), status: :ok
  end

  def destroy
    authorize comment
    comment.destroy!
  end

  private

  def commentable
    @commentable ||= if params[:post_id]
                       Post.find_by(id: params[:post_id])
                     elsif params[:comment_id]
                       Comment.find_by(id: params[:comment_id])
                     else 
                        raise ActionController::ParameterMissing, 'Commentable not found.'
                     end
  end

  def comment
    @comment ||= commentable.comments.find_by(id: params[:id])
  end
end
