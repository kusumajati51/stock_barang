class Item < ApplicationRecord
  mount_uploader :product_picture, PoductPictureUploader
  belongs_to :category
  belongs_to :user
  has_many :order
  before_create :init

  def init
    self.check_out = 0
    self.stock = self.check_in
    self.released_on = Date.today
  end
end