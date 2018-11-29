class PostPolicy < ApplicationPolicy

  def index?
    user.present?
  end

  def show?
    binding.pry
    user.present? && user.projects.include?(record.project)
  end
 
  def create?
    user.present? && user.projects.include?(record.project)
  end

end