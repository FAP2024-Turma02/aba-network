class AttachmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :post

  def index
    @attachments = policy_scope(@post.attachments, policy_scope_class: AttachmentPolicy::Scope)
    render json: @attachments
  end

  def show
    authorize attachment, :show?, policy_class: AttachmentPolicy
    render json: @attachment
  end

  private

  def post
    @post ||= Post.find(params[:post_id])
  end

  def attachment
    @attachment ||= @post.attachments.find(params[:id])
  end
end
