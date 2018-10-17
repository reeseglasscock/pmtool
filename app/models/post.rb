class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project, inverse_of: :posts
  has_many :post_comments, inverse_of: :post_comments
  validates :comment, :title, presence: true

  scope :created_at, -> { order('created_at DESC')}
end
