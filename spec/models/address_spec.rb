require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:person) }
  end

  describe 'Validations' do
    describe 'Presence' do
      it { is_expected.to validate_presence_of(:street) }
      it { is_expected.to validate_presence_of(:city) }
      it { is_expected.to validate_presence_of(:state) }
      it { is_expected.to validate_presence_of(:country) }
    end
  end
end
