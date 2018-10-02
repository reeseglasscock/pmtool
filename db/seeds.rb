# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed
  def self.begin
    seed = Seed.new
    User.destroy_all
    Project.destroy_all
    ProjectsUser.destroy_all
    seed.generate_users
    seed.generate_projects
    seed.add_users_to_projects
    seed.add_project_owners
  end

  def generate_projects
    200.times do
      @project = Project.create!(title: Faker::Commerce.department, description: Faker::Lorem.sentence(25))
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
      @project = Project.all.sample
      @user = User.all.sample
      if @user.projects.include?(@project)
        
      else
        @user.projects << @project
      end
    end
  end

  def add_project_owners
    for project in Project.all do
      @assigned_user = User.all.sample
      project.update(owner: @assigned_user.id)
    end
  end
end

Seed.begin
