class ChangePostCommentsToComments < ActiveRecord::Migration[5.2]
  def change
    rename_table :post_comments, :comments
  end
end
