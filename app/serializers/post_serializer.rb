class PostSerializer < ApplicationSerializer
  def self.call(post)
    base_data = {
      content: post.content,
      users: post.users.map { |user| UserSerializer.call(user) },
      attachments: post.attachments.map do |attachment|
        {
          filename: attachment.filename.to_s,
          url: Rails.application.routes.url_helpers.rails_blob_url(attachment, only_path: true),
          content_type: attachment.content_type
        }
      end
    }
    base_data.merge(serialize_timestamps(post))
  end
end
