class AddProjectOwnerToProjectsUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :projects_users do |t|
      t.boolean :owner, default: false
    end
  end
end
