
class User < ApplicationRecord
  has_secure_password
  has_many :products
  PASSWORD_REQUIREMENTS = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)/x
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,format: VALID_EMAIL_REGEX ,uniqueness: true 
  validates :password, presence: true, format: PASSWORD_REQUIREMENTS
  validates :password_confirmation, presence: true
  validates :name, presence: true, uniqueness: true 
  validates :no_hp, uniqueness: true, presence: true
end
