# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :projects_users
  has_many :posts, inverse_of: :project
  has_many :users, through: :projects_users
  validates :title, presence: true
  validates :description, presence: true

  scope :recent, -> { order('updated_at DESC')}
end
