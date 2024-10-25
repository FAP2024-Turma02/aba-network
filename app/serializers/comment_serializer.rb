class CommentSerializer < ApplicationSerializer
 
    def self.call(comment)
      base_data = {
      content: comment.content,
      user_name: comment.user&.name || "Anonymous"
    }
    
    base_data.merge(serialize_timestamps(comment))
    end
end
