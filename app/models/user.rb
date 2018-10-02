class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :email, presence: true
         validates :password, presence: true
         validates :email, uniqueness: true
  has_many :projects_users
  has_many :projects, :through => :projects_users
end
