# frozen_string_literal: true

class Seed
  def self.begin
    seed = Seed.new
    User.delete_all
    Project.destroy_all
    ProjectsUser.destroy_all
    Post.destroy_all
    seed.generate_users
    seed.generate_projects
    seed.add_users_to_projects
    seed.add_project_owners
    seed.add_posts_to_projects
  end

  def generate_projects
    20.times do
      @project = Project.create!(title: Faker::Commerce.department, description: Faker::Lorem.sentence(25))
    end
  end

  def generate_users
    40.times do
      @name = Faker::Name.unique.name
      User.create!(name: @name, email: Faker::Internet.free_email(@name), password: 'password')
    end
  end

  def add_users_to_projects
    100.times do
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

  def add_posts_to_projects
    for user in User.all do
      for project in user.projects do
        2.times do
          Post.create(title: Faker::Hipster.sentence(5), comment: Faker::Lorem.paragraph(5), user: user, project: project)
        end
      end
    end
  end
end

Seed.begin
