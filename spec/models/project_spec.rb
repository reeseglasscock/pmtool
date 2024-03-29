# frozen_string_literal: true

require 'rails_helper'

describe 'Project' do
  it { validate_presence_of :title }
  it { validate_presence_of :description }
  it { have_and_belong_to_many :users }
  it { have_and_belong_to_many :posts }
end
