class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project, inverse_of: :posts
  validates :comment, :title, presence: true

  scope :recent, -> { order('posts.updated_at DESC')}
end
