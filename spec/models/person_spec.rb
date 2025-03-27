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

    describe 'Comparison' do
      describe '#birthdate' do
        context 'when has a birthdate less than today' do
          let!(:person) { build(:person, birthdate: Date.today - 1) }

          it { expect(person).to be_valid }
        end

        context 'when has a birthdate greater than today' do
          let!(:person) { build(:person, birthdate: Date.today + 1) }

          it { expect(person).not_to be_valid }
        end
      end
    end

    describe 'Format' do
      describe 'validates that phone has a correct format' do
        it { is_expected.to allow_value("(12) 34567-8901").for(:phone) }
        it { is_expected.not_to allow_value("12345678901").for(:phone) }
        it { is_expected.not_to allow_value("(12) 3456-7890").for(:phone) }
        it { is_expected.not_to allow_value("(ab) cdefg-hijk").for(:phone) }
      end
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
