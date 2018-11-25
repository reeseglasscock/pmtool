require 'rails_helper'

RSpec.describe Post, type: :model do
  it { belong_to :projects }
  it { belong_to :users }
  it { have_many :comments }
end
