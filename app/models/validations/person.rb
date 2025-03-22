module Validations
  module Person
    extend ActiveSupport::Concern

    included do
      validates :name, :email, presence: true
    end
  end
end