class Category < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  has_many :items, dependent: :destroy
  belongs_to :user
end
