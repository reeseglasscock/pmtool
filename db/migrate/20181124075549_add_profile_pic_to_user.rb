class AddProfilePicToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_picture, :string
  end
end
