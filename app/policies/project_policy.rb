class ProjectPolicy < ApplicationPolicy

  def index?
    user.present?
  end

  def show?
    user.projects.include?(record)
  end
 
  def create?
    user.present?
  end
 
  def update?
    return true if user.present? && is_owner?
  end
 
  def destroy?
    return true if user.present? && is_owner?
  end

  def destroy_user?
    return true if user.present? && is_owner?
  end

  private

  def is_owner?
    record.owner_in_database == user.id
  end

end