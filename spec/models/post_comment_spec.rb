require 'rails_helper'

RSpec.describe PostComment, type: :model do
  it { belong_to :posts }
  it { belong_to :users }
end
