class CommentSerializer < ApplicationSerializer
 
    def self.call(comment)
      base_data = {
      content: comment.content,
      user_name: comment.user&.name || "Anonymous",
      commentable_id: comment.commentable_id,
      commentable_type: comment.commentable_type
    }
    
    base_data.merge(serialize_timestamps(comment))
    end
end
