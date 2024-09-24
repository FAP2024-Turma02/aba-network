class Post < ApplicationRecord
    has_many :attachments
    
    validates :content, presence: true
    validates :published, inclusion: { in: [true, false] }
end
