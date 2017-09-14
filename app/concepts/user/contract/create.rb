module User::Contract
  # new user form object
  class Create < Reform::Form
    property :name
    property :password, virtual: true
    property :email

    validates :password, :email, presence: true
    validates_uniqueness_of :email
  end
end
