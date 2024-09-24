class Attachment < ApplicationRecord
  belongs_to :record, polymorphic: true
  belongs_to :post
  has_many_attached :files

end
