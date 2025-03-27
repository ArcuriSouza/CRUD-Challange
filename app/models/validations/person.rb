module Validations
  module Person
    extend ActiveSupport::Concern

    included do
      validates :name, :email, presence: true
      validates :phone, format: { with: /\A\([0-9]{2}\) [0-9]{5}-[0-9]{4}\z/,
                                  message: "%{attribute} deve ser no formato (00) 00000-0000" },
                        if: -> { phone.present? }
      validates :email, uniqueness: true
    end
  end
end
