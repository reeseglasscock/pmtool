require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { belong_to :posts }
  it { belong_to :users }
end
