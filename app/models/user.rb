# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_destroy :remove_assigned_projects_and_created_posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  validates :email, presence: true
  # validates :password, presence: true
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

  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID   
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
      user.password = Devise.friendly_token[0,20]
      user.profile_picture = auth.info.image
      binding.pry
    end
  end
end
