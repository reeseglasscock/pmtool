class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project, inverse_of: :posts
  has_many :post_comments
  accepts_nested_attributes_for :post_comments
  validates :comment, :title, presence: true

  scope :created_at, -> { order('created_at DESC')}
end
