module Session
  module Contract
    class New < Reform::Form
      property :email, virtual: true
      property :password, virtual: true
      validates :email, :password, presence: true
      validate :password_ok?

      attr_reader :user

      private

      def password_ok?
        return if email.blank? || password.blank?
        @user = User.find_by(email: email)
        return if @user && password_matches?
        errors.add(:password, 'wrong credentials.')
      end

      def password_matches?
        Tyrant::Authenticatable.new(@user).digest?(password)
      end
    end
  end
end
