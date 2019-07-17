class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :password, on: :create
  has_many :blogs, dependent: :destroy
end
