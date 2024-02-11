# frozen_string_literal: true

# comment class
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 300 }
  validates :post_id, presence: true

  default_scope -> { order(created_at: :desc) }
end
