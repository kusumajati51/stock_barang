class Item < ApplicationRecord
  mount_uploader :product_picture, PoductPictureUploader
  belongs_to :category
  belongs_to :brand
  has_one  :inventory
  has_many :variant_sizes
  has_many :order
 
end