require "reform"
require "reform/form/dry"

module Session
  module Contract
    class Create < Reform::Form
      # include Dry
      property :name
      property :email
      property :password, virtual: true
      property :confirm_password, virtual: true

      validates :email, :password, :confirm_password, presence: true
      validate :password_ok?

      private

      def password_ok?
        return unless email && password
        return if password == confirm_password
        errors.add(:password, 'Passwords don\'t match')
      end
    end
  end
end
