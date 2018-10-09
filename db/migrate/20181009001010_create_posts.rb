class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :project_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end

    add_index :posts, [:project_id, :user_id]
  end
end
