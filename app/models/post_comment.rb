class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post, inverse_of: :post_comments
end
