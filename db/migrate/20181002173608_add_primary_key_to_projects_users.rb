class AddPrimaryKeyToProjectsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :projects_users, :id, :primary_key
  end
end
