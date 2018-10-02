class Project < ApplicationRecord
  has_and_belongs_to_many :users
  validates :title, presence: true
  validates :description, presence: true
end