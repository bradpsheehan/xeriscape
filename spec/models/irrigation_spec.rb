require 'rails_helper'

RSpec.describe Irrigation, type: :model do
  it { should belong_to(:plant) }
end
