require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should validate_presence_of(:value) }
  it { should_not allow_value("a50").for(:value) }
  it { should_not allow_value("50,1a").for(:value) }
  it { should_not allow_value("5a0a,1a").for(:value) }
  it { should allow_value("50").for(:value) }
  it { should allow_value("50,1").for(:value) }
end
