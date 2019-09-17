class Product < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  belongs_to :category
  belongs_to :user

end
