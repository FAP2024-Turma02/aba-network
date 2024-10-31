class PostsController < ApplicationController
  def index
    set_post = policy_scope(Post).order(created_at: :desc)
    render json: set_post.map { |post| PostSerializer.call(post) }
  end

  def show
    authorize set_post
    render json: PostSerializer.call(set_post)
  end

  def create
    post = Post.create(permitted_attributes(Post))
    authorize post
    post.users << current_user

      if params[:post][:attachments].present?
        Array(params[:post][:attachments]).each do |attachment|
          post.attachments.attach(attachment)
        end
      end

      render json: PostSerializer.call(post), status: :created
  end
  
  def update
    authorize set_post
    set_post.update!(permitted_attributes(Post))
    
    if params[:post][:attachments].present?
      Array(params[:post][:attachments]).each do |attachment|
        post.attachments.attach(attachment)
      end
    end
    
    render json: PostSerializer.call(set_post), status: :ok
  end
  
  private

  def set_post
    @post ||= Post.find(params[:id])
  end
end
