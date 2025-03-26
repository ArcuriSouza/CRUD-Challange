class Person < ApplicationRecord
  include Validations::Person

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address, reject_if: :all_blank
end
