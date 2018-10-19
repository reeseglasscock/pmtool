class AddCommentToPostCommentsTable < ActiveRecord::Migration[5.2]
  def change
     add_column :post_comments, :comment, :text
  end
end
