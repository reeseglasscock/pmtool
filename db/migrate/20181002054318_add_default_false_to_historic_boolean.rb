# frozen_string_literal: true

class AddDefaultFalseToHistoricBoolean < ActiveRecord::Migration[5.2]
  def change
    change_column :projects_users, :historic, :boolean, default: false
  end
end
