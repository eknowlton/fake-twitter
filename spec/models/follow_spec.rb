require 'rails_helper'

RSpec.describe Follow, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(build_stubbed(:follow)).to be_valid
    end
  end
end
