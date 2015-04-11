require 'rails_helper'

RSpec.describe Note, :type => :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:published) }
end
