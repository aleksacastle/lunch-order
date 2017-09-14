class User::Operation
  # user creation
  class Create < Trailblazer::Operation
    # new user form
    class Present < Trailblazer::Operation
      step Model(User, :new)
      step Contract::Build(constant: User::Contract::Create)
      step Policy::Pundit(UserPolicy, :create?)
    end

    step Nested(Present)
    step Contract::Validate()
    step :invoke_tyrant
    step Contract::Persist()
    step :set_admin

    private

    def invoke_tyrant(options, _hsh)
      contract = options['contract.default']
      auth = Tyrant::Authenticatable.new(contract.model)
      auth.digest!(contract.password)
      auth.confirmed!
      auth.sync
    end

    def set_admin
      User.first.update_attribute(:admin, true)
    end
  end
end
