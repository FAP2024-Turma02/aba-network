class Post < ApplicationRecord
    has_many :comments, as: :commentable

    validates :content, presence: true
    validates :published, inclusion: { in: [true, false] }

    has_many :post_users, dependent: :destroy
    has_many :users, through: :post_users
end
