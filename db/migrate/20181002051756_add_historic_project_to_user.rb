# frozen_string_literal: true

class AddHistoricProjectToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :projects_users do |t|
      t.boolean :historic
    end
  end
end
