require 'rails_helper'

RSpec.describe Garden, type: :model do
  it { should have_many(:plants) }
end
