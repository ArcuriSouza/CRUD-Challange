class Address < ApplicationRecord
  include Validations::Address

  belongs_to :person
end
