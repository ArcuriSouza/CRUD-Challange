module Validations
  module Person
    extend ActiveSupport::Concern

    included do
      validates :name, :email, presence: true
      validates :email, uniqueness: true
    end
  end
end
