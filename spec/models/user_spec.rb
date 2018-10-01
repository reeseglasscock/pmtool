require 'rails_helper'

describe 'User' do
  it { validate_presence_of :email}
  it { validate_presence_of :password}
  it { validate_uniqueness_of :email}
  it { have_and_belong_to_many :projects}
end