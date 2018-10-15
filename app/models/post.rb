class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project, inverse_of: :posts
  validates :comment, :title, presence: true

  scope :created_at, -> { order('created_at DESC')}
end
