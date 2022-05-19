class User < ApplicationRecord
  require 'securerandom'

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :hotels, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
