# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed

  def self.begin
    seed = User.destroy_all
    seed = Project.destroy_all
    seed = Seed.new
    seed.generate_users
    seed.generate_projects
    seed.add_users_to_projects
  end

  def generate_projects
    200.times do
      Project.create!(title: Faker::Commerce.department, description: Faker::Lorem.sentence(25))
    end
  end

  def generate_users
    20.times do
      @name = Faker::Name.name
      User.create!(name: @name, email: Faker::Internet.free_email(@name), password: 'password')
    end
  end

  def add_users_to_projects
    500.times do
      @project = Project.all.shuffle.first
      @user = User.all.shuffle.first
      @user.projects << @project
    end
  end
end

Seed.begin