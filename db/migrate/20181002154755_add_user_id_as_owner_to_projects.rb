class AddUserIdAsOwnerToProjects < ActiveRecord::Migration[5.2]
  def change
    change_table :projects do |t|
      t.integer :owner, default: nil
    end
  end
end
