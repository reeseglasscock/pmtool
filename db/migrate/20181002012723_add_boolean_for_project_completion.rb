class AddBooleanForProjectCompletion < ActiveRecord::Migration[5.2]
  def change
    change_table :projects do |t|
      t.boolean :complete, default: false
    end
  end
end
