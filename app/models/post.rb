# frozen_string_literal: true

# post model
class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
end
