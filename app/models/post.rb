class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project, inverse_of: :posts
end
