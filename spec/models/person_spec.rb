require "rails_helper"

RSpec.describe Person, type: :model do
  describe 'Associations' do
    it { is_expected.to have_one(:address).dependent(:destroy) }
    it { is_expected.to accept_nested_attributes_for(:address) }
  end

  describe 'Validations' do
    describe 'Presence' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:email) }
    end

    describe 'Uniqueness' do
      describe '#email' do
        let!(:first_person) { create(:person) }

        context 'when a person has entered with a unique email' do
          let!(:second_person) { build(:person, email: 'second_person@gmail.com') }

          it { expect(second_person).to be_valid }
        end

        context 'when a person has entered with a existing email' do
          let!(:second_person) { build(:person) }

          it { expect(second_person).not_to be_valid }
        end
      end
    end
  end
end