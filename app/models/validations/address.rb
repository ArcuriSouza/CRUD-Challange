module Validations
  module Address
    extend ActiveSupport::Concern

    included do
      validates :street, :city, :state, presence: true
    end
  end
end
