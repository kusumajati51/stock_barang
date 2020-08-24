class Brand < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :items
  validates :name, presence: true
end
