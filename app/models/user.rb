# frozen_string_literal: true

# user model
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, presence: true
  validates :username, presence: true
end
