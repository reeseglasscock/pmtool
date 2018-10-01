require 'rails_helper'

describe 'Project' do
  it { validate_presence_of :title}
  it { validate_presence_of :description}
end