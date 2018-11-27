class ProjectPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    user.projects.include?(record)
  end
 
  def create?
    user.present?
  end
 
  def update?
    return true if user.present? && user == project.user
  end
 
  def destroy?
    return true if user.present? && user == project.user
  end
 
end