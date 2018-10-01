require 'rails_helper'

describe 'User' do
  it { validate_presence_of :email}
  it { validate_presence_of :password}
  it { validate_uniqueness_of :email}
end