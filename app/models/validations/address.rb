module Validations
  module Address
    extend ActiveSupport::Concern

    included do
      validates :street, :city, :state, :country, presence: true
    end
  end
end
