class Post < ApplicationRecord
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :post_users, dependent: :destroy
    has_many :users, through: :post_users
    has_many_attached :attachments

    validates :content, presence: true
    validates :published, inclusion: { in: [true, false] }
end
