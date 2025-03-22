class Person < ApplicationRecord
  include Validations::Person

  has_one :address
  accepts_nested_attributes_for :address, reject_if: :all_blank
end
