require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(build_stubbed(:like)).to be_valid
    end

    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:tweet) }
  end
end
