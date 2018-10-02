# frozen_string_literal: true

class ProjectsUser < ApplicationRecord
  belongs_to :user
  belongs_to :project
end
