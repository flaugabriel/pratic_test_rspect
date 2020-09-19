require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'validate presence of' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:control_number) }
    it { should validate_presence_of(:status) }
  end
end
