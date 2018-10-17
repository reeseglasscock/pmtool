# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_destroy :remove_assigned_projects_and_created_posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true
  validates :password, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true
  has_many :projects_users
  has_many :projects, through: :projects_users
  has_many :posts
  has_many :post_comments

  def remove_assigned_projects_and_created_posts
    Post.where(user_id: self.id).destroy_all
    ProjectsUser.where(user_id: self.id).destroy_all
  end
end
