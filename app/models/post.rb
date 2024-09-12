class Post < ApplicationRecord
    validates :content, presence: true
    validates :published, inclusion: { in: [true, false] }
end
